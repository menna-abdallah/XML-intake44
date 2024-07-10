<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <title>CD Catalog</title>
        <style>
          /* Define styles for different price ranges */
          .high-price { color: red; }
          .medium-price { color: blue; }
          .low-price { color: green; }
        </style>
      </head>
      <body>
        <h2>CD Catalog</h2>
        <table border="1">
          <tr>
            <th>Title</th>
            <th>Artist</th>
            <th>Price</th>
          </tr>
          <xsl:apply-templates select="catalog/cd"/>
        </table>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="cd">
    <xsl:if test="country='USA' and year > 1990">
      <tr>
        <td><xsl:value-of select="title"/></td>
        <td><xsl:value-of select="artist"/></td>
        <td>
          <xsl:attribute name="class">
            <xsl:choose>
              <xsl:when test="price &gt;= 10">
                high-price
              </xsl:when>
              <xsl:when test="price &gt;= 8 and price &lt; 10">
                medium-price
              </xsl:when>
              <xsl:otherwise>
                low-price
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <xsl:value-of select="concat('$', price)"/>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
