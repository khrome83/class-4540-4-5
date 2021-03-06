<?xml version="1.0" encoding="UTF-8"?>
<!--
    Name: Zane C. Milakovic
    Date: 10/21/2015
    File: president_table.xsl
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    
    <!-- used for translation of party to a proper css class name -->
    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz-'" />
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ '" />
    
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
        <xsl:element name="td">
            <xsl:attribute name="class">
                <!-- based on concepts from stackoverflow post to translate the data with XSLT 1.0 -->
                <!-- http://stackoverflow.com/questions/586231/how-can-i-convert-a-string-to-upper-or-lower-case-with-xslt -->
                <xsl:value-of select="translate(., $uppercase, $smallcase)"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="term">
        <tr>
            <td class="number"><xsl:value-of select="number"/></td>
            <td class="vice_president"><xsl:value-of select="vice_president"/></td>
        </tr>
    </xsl:template>
    
     <xsl:template match="president">
        <tr>
            <xsl:apply-templates select="name"/>
            <xsl:apply-templates select="birthday"/>
            <xsl:apply-templates select="took_office"/>
            <xsl:apply-templates select="left_office"/>
            <xsl:apply-templates select="party"/>
            <td>
                <table class="vice_presidents">
                    <tbody>
                        <xsl:apply-templates select="term"/>
                    </tbody>
                </table>
            </td>
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
                    <th>Vice Presidents</th>
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