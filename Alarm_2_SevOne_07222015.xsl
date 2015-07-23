<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:alar="http://tmforum.verizon.com/tip/resource/trouble/alarm"
    xmlns:ent="http://tmforum.verizon.com/tip/internal/entity"
    xmlns:base="http://tmforum.verizon.com/tip/cbe/base"
    xmlns:prob="http://tmforum.verizon.com/tip/cbe/problem"
    xmlns:nrb="http://tmforum.verizon.com/tip/resource/res/nrb"
    exclude-result-prefixes="xs alar ent base prob nrb" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <SurveillanceSystemAlerts>
            <VZ>
                <AlarmOrigin>BLM</AlarmOrigin>
            </VZ>
            <SevOneAlarm>
                <id>
                    <xsl:value-of
                        select="//*[local-name() = 'resourceAlarm']//*[local-name() = 'alarmId']"/>
                </id>
                <severity>
                    <xsl:variable name="temp" select="/alar:resourceAlarm/alar:perceivedSeverity"/>
                    <xsl:choose>
                        <xsl:when test="$temp = 'Critical'">0</xsl:when>
                        <xsl:when test="$temp = 'Major'">1</xsl:when>
                        <xsl:when test="$temp = 'Minor'">3</xsl:when>
                        <xsl:when test="$temp = 'Warning'">4</xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="/alar:resourceAlarm/alar:perceivedSeverity"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </severity>
                <isCleared>
                    <xsl:value-of select="/alar:resourceAlarm/alar:managedObjectClass"/>
                </isCleared>
                <owner>
                    <xsl:for-each select="/alar:resourceAlarm/ent:aliasNames/ent:item">
                        <xsl:variable name="key" select="ent:name"/>
                        <xsl:if test="$key = 'Owner'">
                            <xsl:value-of select="ent:value"/>
                        </xsl:if>
                    </xsl:for-each>
                </owner>
                <ClassName>
                    <xsl:value-of select="/alar:resourceAlarm/ent:identifier/ent:context"/>
                </ClassName>
                <SurveillanceSource>
                    <xsl:value-of select="/alar:resourceAlarm/alar:managedObjectInstance/ent:id"/>
                </SurveillanceSource>
                <CustomerInstanceName>
                    <xsl:value-of select="/alar:resourceAlarm/ent:identifier/ent:id"/>
                </CustomerInstanceName>
                <ipAddress>
                    <xsl:for-each select="/alar:resourceAlarm/ent:aliasNames/ent:item">
                        <xsl:variable name="key" select="ent:name"/>
                        <xsl:if test="$key = 'IPAddress'">
                            <xsl:value-of select="ent:value"/>
                        </xsl:if>
                    </xsl:for-each>
                </ipAddress>
                <eventType>
                    <xsl:value-of select="/alar:resourceAlarm/alar:alarmType"/>
                </eventType>
                <eventName>
                    <xsl:value-of select="/alar:resourceAlarm/ent:identifier/ent:entityType"/>
                </eventName>
                <applicationName>
                    <xsl:value-of select="/alar:resourceAlarm/alar:systemDN"/>
                </applicationName>
                <startTime>
                    <xsl:value-of select="/alar:resourceAlarm/alar:alarmRaisedTime"/>
                </startTime>
                <endTime>
                    <xsl:value-of select="/alar:resourceAlarm/alar:alarmClearedTime"/>
                </endTime>
                <message>
                    <xsl:value-of
                        select="/alar:resourceAlarm/alar:managedObjectInstance/ent:context"/>
                </message>
            </SevOneAlarm>
        </SurveillanceSystemAlerts>
    </xsl:template>
</xsl:stylesheet>
