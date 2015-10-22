<?xml version="1.0" encoding="UTF-8"?>
<!--
    Name: Zane C. Milakovic
    Date: 10/21/2015
    File: president_table.xsl
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    
    <xsl:template match="name">
        <td class="name"><xsl:value-of select="."/></td>
    </xsl:template>
    
    <xsl:template match="birthday">
        <td class="birthday"><xsl:value-of select="."/></td>
    </xsl:template>
    
    <xsl:template match="took_office">
        <td class="took_office"><xsl:value-of select="."/></td>
    </xsl:template>
    
    <xsl:template match="left_office">
        <td class="left_office"><xsl:value-of select="."/></td>
    </xsl:template>
    
    <xsl:template match="party">
        <td class="party"><xsl:value-of select="."/></td>
    </xsl:template>
    
     <xsl:template match="president">
        <tr>
            <xsl:apply-templates select="name"/>
            <xsl:apply-templates select="birthday"/>
            <xsl:apply-templates select="took_office"/>
            <xsl:apply-templates select="left_office"/>
            <xsl:apply-templates select="party"/>
        </tr>
     </xsl:template>
    
     <xsl:template match="presidents">
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Birthday</th>
                    <th>Took Office</th>
                    <th>Left Office</th>
                    <th>Party</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="president"/>
            </tbody>
        </table>
     </xsl:template>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Table of US Presidents</title>
                <link rel="stylesheet" href="president_table.css"/>
            </head>
            <body>
                <h1>Table of US Presidents</h1>
                <xsl:apply-templates select="presidents"/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>