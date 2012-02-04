<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>

	<xsl:template match="map">
		<xsl:text>var </xsl:text><xsl:value-of select="descendant::node/@TEXT"/>= {<xsl:apply-templates/>}</xsl:template><xsl:template name="top" match="map/node/node">"<xsl:value-of select="descendant-or-self::node/@TEXT"/>": {<xsl:apply-templates select="node"/>}</xsl:template>

	<xsl:template name="leadingitems" match="node/node[position()=1]">"<xsl:value-of select="descendant-or-self::node/@TEXT"/>"<xsl:if test="node">: {</xsl:if><xsl:if test="not(*)">:10</xsl:if>
		<xsl:if test="node">
			<xsl:apply-templates select="node"/>}</xsl:if>
	</xsl:template>

	<xsl:template name="trailingitems" match="node/node[position()&gt;1]">, 
		"<xsl:value-of select="descendant-or-self::node/@TEXT"/>"<xsl:if test="node">: {</xsl:if>
		<xsl:if test="not(*)">:10</xsl:if>
		<xsl:if test="node"><xsl:apply-templates select="node"/>}</xsl:if>
	</xsl:template>
</xsl:stylesheet>
<!-- Copyright Andrew Morgan 2012.
     See README for License.
-->