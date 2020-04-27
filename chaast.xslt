<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:key name="products-by-category" match="products" use="@category" />

<xsl:template match="/">
<div>
<h2>Total number of goods:<xsl:value-of select="count(//products)"/></h2>
<xsl:apply-templates select="//products[generate-id(.) = generate-id(key('products-by-category', @category)[1] )]"/>
</div>
</xsl:template>

<xsl:template match="products">
<h2>value: <xsl:value-of select="@category"/></h2>
<h3>Total: <xsl:value-of select="count(//products[@category = current()/@category])"/></h3>
<ul>
<xsl:apply-templates select="key('products-by-category', @category)" mode="grouping"/>
</ul>
</xsl:template>
<xsl:template match="products" mode="grouping">
<li><a href="{//link}"><xsl:value-of select="@name"/></a> -
<xsl:value-of select="//price"/>
</li>
</xsl:template>

</xsl:stylesheet>