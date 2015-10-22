<?xml version="1.0" encoding="UTF-8"?>
<!--
    Name: Zane C. Milakovic
    Date: 10/21/2015
    File: president_table.xsl
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    
     <xsl:template match="president">
        <p><xsl:value-of select="name"/></p>
     </xsl:template>
    
    
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Table of US Presidents</title>
                <link rel="stylesheet" href="president_table.css"/>
            </head>
            <body>
                <h1>Table of US Presidents</h1>
                <xsl:apply-templates select= "presidents/president"/> 
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>