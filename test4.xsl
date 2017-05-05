<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" doctype-system="about:legacy-compat" />

<xsl:template match="/">
	<html>
	  <head>
	    <meta charset="utf-8" />
	    <title>Test4</title>
	    <style>
	    html {
	    	font-family: arial;
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

<xsl:template match="para">
	<p>
		<xsl:apply-templates />
	</p>
</xsl:template>

<xsl:template match="//*[@type='ordered-list']">
	<ol class="{string(@style)}">
		<xsl:apply-templates />
	</ol>
</xsl:template>

<xsl:template match="image">
	<div>
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

</xsl:stylesheet>