<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" doctype-system="about:legacy-compat" />

<xsl:template match="/event">
	<html>
	  <head>
	    <meta charset="utf-8" />
	    <title>
	    	<xsl:value-of select="concat('Event ', string(@id))" />
	    </title>
	    <style>
	    html {
	    	font-family: arial;
	    }
	    li {
	    	padding: 1em 0;
	    }
	    .img-with-desc {
	    	max-width: 74%;
	    	display: inline-block;
	    	text-align: center;
	    }
	    .img-with-desc img {
	    	max-width: 100%;
	    }
	    .img-with-desc p {
	    	padding: 0 1em;
	    }
	    .doc-level {
	    	padding: 1em;
	    }
	    .redbox {
	    	background-color: darkred;
	    	color: white;
	    }
	    .roman {
	    	font-style: normal;
	    }
	    .bluebox {
	    	background-color: indigo;
	    	color: white;
	    }
	    .centered {
	    	text-align: center;
	    }
	    .right {
	    	padding-right: 0;
	    	text-align: right;
	    }
	    .comment {
	    	background-color: lightgrey;
	    	color: lightslategrey;
	    }
	    </style>
	  </head>
	  <body> 
	    <xsl:apply-templates />
	  </body>
	</html>
</xsl:template>

<xsl:template match="doc-level">
	<div class="doc-level {string(@type)} {string(@position)}">
		<xsl:apply-templates />
	</div>
</xsl:template>

<xsl:template match="//*[@type='ordered-list']">
	<ol class="{string(@style)}">
		<xsl:apply-templates />
	</ol>
</xsl:template>

<xsl:template match="para">
	<p>
		<xsl:apply-templates />
	</p>
</xsl:template>


<xsl:template match="image">
	<div class="img-with-desc">
		<img src="{string(@source)}" alt="{string(@description)}" />
		<p>
			<xsl:value-of select="@description" />
		</p>
	</div>
</xsl:template>

<xsl:template match="list-item">
	<li>
	<xsl:value-of select="." />
	</li>
</xsl:template>

<xsl:template match="table">
	<table>
	<tbody>
		<xsl:apply-templates />
	</tbody>
	</table>
</xsl:template>

<xsl:template match="table-heading">
	<th>
		<td colspan="0">
			<xsl:value-of select="." />
		</td>
	</th>
</xsl:template>

</xsl:stylesheet>