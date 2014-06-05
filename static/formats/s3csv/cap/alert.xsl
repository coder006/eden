<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- **********************************************************************
         CAP template - CSV Import Stylesheet

         CSV column..................Format.............Content

         is_template.................string.............CAP template is_template
         template_title..............string.............CAP template template_title
         identifier..................string.............CAP template identifier
         sender......................string.............CAP template sender
         status......................string.............CAP template sender

    *********************************************************************** -->
    <xsl:output method="xml"/>

    <!-- ****************************************************************** -->
    <xsl:template match="/">
        <s3xml>
            <xsl:apply-templates select="./table/row"/>
        </s3xml>
    </xsl:template>

    <!-- ****************************************************************** -->
    <xsl:template match="row">
        <resource name="cap_alert">
            <xsl:attribute name="uuid">
                <xsl:text>urn:uuid:</xsl:text>
                <xsl:value-of select="col[@field='identifier']"/>
            </xsl:attribute>
            <data field="is_template">
                <xsl:attribute name="value">
                    <xsl:value-of select="col[@field='is_template']"/>
                </xsl:attribute>
            </data>
            <data field="template_title"><xsl:value-of select="col[@field='template_title']"/></data>
            <data field="template_settings"><xsl:text>{}</xsl:text></data>
            <data field="sender">
                <xsl:value-of select="col[@field='sender']"/>
            </data>
            <data field="status">
                <xsl:value-of select="col[@field='status']"/>
            </data>
            <data field="msg_type">
                <xsl:value-of select="col[@field='msg_type']"/>
            </data>
            <data field="scope">
                <xsl:value-of select="col[@field='scope']"/>
            </data>
            <data field="incidents">
                <xsl:attribute name="value">
                    <xsl:value-of select="col[@field='incidents']"/>
                </xsl:attribute>
                <xsl:text>Fire</xsl:text>
            </data>
        </resource>
    </xsl:template>
    <!-- ****************************************************************** -->

</xsl:stylesheet>
