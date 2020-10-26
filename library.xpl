<p:library version="1.0"
           xmlns:c="http://www.w3.org/ns/xproc-step"
           xmlns:o="http://dmaus.name/ns/oai-pmh"
           xmlns:oai="http://www.openarchives.org/OAI/2.0/"
           xmlns:p="http://www.w3.org/ns/xproc">

  <p:documentation xmlns="http://www.w3.org/1999/xhtml">
    An OAI-PMH client implemented in XProc 1.0
  </p:documentation>

  <p:declare-step type="o:Identify">
    <p:output port="result" primary="true"/>
    <p:option name="baseUrl" required="true"/>

    <o:createHttpRequest>
      <p:with-option name="baseUrl" select="$baseUrl"/>
      <p:input port="source">
        <p:inline>
          <c:param-set>
            <c:param name="verb" value="Identify"/>
          </c:param-set>
        </p:inline>
      </p:input>
    </o:createHttpRequest>

    <p:http-request/>
    <o:check-response/>

  </p:declare-step>

  <p:declare-step type="o:ListSets">
    <p:output port="result" primary="true" sequence="true"/>
    <p:option name="baseUrl" required="true"/>

    <p:parameters name="parameters">
      <p:input port="parameters">
        <p:inline>
          <c:param-set>
            <c:param name="verb" value="ListSets"/>
          </c:param-set>
        </p:inline>
      </p:input>
    </p:parameters>

    <o:createHttpRequest>
      <p:with-option name="baseUrl" select="$baseUrl"/>
      <p:input port="source">
        <p:pipe step="parameters" port="result"/>
      </p:input>
    </o:createHttpRequest>

    <p:http-request/>
    <o:check-response/>

    <o:collect verb="ListSets">
      <p:with-option name="baseUrl" select="$baseUrl"/>
    </o:collect>

  </p:declare-step>

  <p:declare-step type="o:ListMetadataFormats">
    <p:output port="result" primary="true"/>
    <p:option name="baseUrl" required="true"/>

    <p:option name="identifier" required="true"/>

    <p:parameters name="parameters">
      <p:with-param name="identifier" select="$identifier" port="parameters"/>
      <p:input port="parameters">
        <p:inline>
          <c:param-set>
            <c:param name="verb" value="ListMetadataFormats"/>
          </c:param-set>
        </p:inline>
      </p:input>
    </p:parameters>

    <o:createHttpRequest>
      <p:with-option name="baseUrl" select="$baseUrl"/>
      <p:input port="source">
        <p:pipe step="parameters" port="result"/>
      </p:input>
    </o:createHttpRequest>

    <p:http-request/>
    <o:check-response/>

  </p:declare-step>

  <p:declare-step type="o:ListIdentifiers">
    <p:output port="result" primary="true" sequence="true"/>
    <p:option name="baseUrl" required="true"/>

    <p:option name="metadataPrefix" required="true"/>
    <p:option name="set" required="false"/>
    <p:option name="from" required="false"/>
    <p:option name="until" required="false"/>

    <p:parameters name="parameters">
      <p:with-param name="metadataPrefix" select="$metadataPrefix" port="parameters"/>
      <p:with-param name="set" select="$set" port="parameters"/>
      <p:with-param name="from" select="$from" port="parameters"/>
      <p:with-param name="until" select="$until" port="parameters"/>
      <p:input port="parameters">
        <p:inline>
          <c:param-set>
            <c:param name="verb" value="ListIdentifiers"/>
          </c:param-set>
        </p:inline>
      </p:input>
    </p:parameters>

    <o:createHttpRequest>
      <p:with-option name="baseUrl" select="$baseUrl"/>
      <p:input port="source">
        <p:pipe step="parameters" port="result"/>
      </p:input>
    </o:createHttpRequest>

    <p:http-request/>
    <o:check-response/>

    <o:collect verb="ListIdentifiers">
      <p:with-option name="baseUrl" select="$baseUrl"/>
    </o:collect>

  </p:declare-step>

  <p:declare-step type="o:ListRecords">
    <p:output port="result" primary="true" sequence="true"/>
    <p:option name="baseUrl" required="true"/>

    <p:option name="metadataPrefix" required="true"/>
    <p:option name="set" required="false"   select="''"/>
    <p:option name="from" required="false"  select="''"/>
    <p:option name="until" required="false" select="''"/>

    <p:parameters name="parameters">
      <p:with-param name="metadataPrefix" select="$metadataPrefix" port="parameters"/>
      <p:with-param name="set" select="$set" port="parameters"/>
      <p:with-param name="from" select="$from" port="parameters"/>
      <p:with-param name="until" select="$until" port="parameters"/>
      <p:input port="parameters">
        <p:inline>
          <c:param-set>
            <c:param name="verb" value="ListRecords"/>
          </c:param-set>
        </p:inline>
      </p:input>
    </p:parameters>

    <o:createHttpRequest>
      <p:with-option name="baseUrl" select="$baseUrl"/>
      <p:input port="source">
        <p:pipe step="parameters" port="result"/>
      </p:input>
    </o:createHttpRequest>

    <p:http-request/>
    <o:check-response/>

    <o:collect verb="ListRecords">
      <p:with-option name="baseUrl" select="$baseUrl"/>
    </o:collect>

  </p:declare-step>

  <p:declare-step type="o:GetRecord">
    <p:output port="result" primary="true"/>
    <p:option name="baseUrl" required="true"/>

    <p:option name="identifier" required="true"/>
    <p:option name="metadataPrefix" required="true"/>

    <p:parameters name="parameters">
      <p:with-param name="identifier" select="$identifier" port="parameters"/>
      <p:with-param name="metadataPrefix" select="$metadataPrefix" port="parameters"/>
      <p:input port="parameters">
        <p:inline>
          <c:param-set>
            <c:param name="verb" value="GetRecord"/>
          </c:param-set>
        </p:inline>
      </p:input>
    </p:parameters>

    <o:createHttpRequest>
      <p:with-option name="baseUrl" select="$baseUrl"/>
      <p:input port="source">
        <p:pipe step="parameters" port="result"/>
      </p:input>
    </o:createHttpRequest>

    <p:http-request/>
    <o:check-response/>

  </p:declare-step>

  <p:declare-step type="o:resume">
    <p:documentation xmlns="http://www.w3.org/1999/xhtml">
      Return next item in a list response.
    </p:documentation>

    <p:output port="result" primary="true" sequence="true"/>
    <p:option name="baseUrl" required="true"/>

    <p:option name="verb" required="true"/>
    <p:option name="resumptionToken" required="true"/>

    <p:parameters name="parameters">
      <p:with-param name="verb" select="$verb" port="parameters"/>
      <p:with-param name="resumptionToken" select="$resumptionToken" port="parameters"/>
      <p:input port="parameters">
        <p:empty/>
      </p:input>
    </p:parameters>

    <o:createHttpRequest>
      <p:with-option name="baseUrl" select="$baseUrl"/>
      <p:input port="source">
        <p:pipe step="parameters" port="result"/>
      </p:input>
    </o:createHttpRequest>

    <p:http-request/>
    <o:check-response/>

  </p:declare-step>

  <p:declare-step type="o:collect" name="collect">
    <p:documentation xmlns="http://www.w3.org/1999/xhtml">
      Return a sequence of OAI-PMH response documents. Expects an OAI-PHM response document at the primary input port
      that acts as first document in a list response.
    </p:documentation>

    <p:input  port="source" primary="true"/>
    <p:output port="result" primary="true" sequence="true"/>
    <p:option name="baseUrl" required="true"/>
    <p:option name="verb" required="true"/>

    <p:choose>
      <p:when test="/oai:OAI-PMH/*/oai:resumptionToken">
        <o:resume name="resume">
          <p:with-option name="baseUrl" select="$baseUrl"/>
          <p:with-option name="verb" select="$verb"/>
          <p:with-option name="resumptionToken" select="/oai:OAI-PMH/*/oai:resumptionToken"/>
        </o:resume>
        <p:identity>
          <p:input port="source">
            <p:pipe step="collect" port="source"/>
            <p:pipe step="resume"  port="result"/>
          </p:input>
        </p:identity>
      </p:when>
      <p:otherwise>
        <p:identity/>
      </p:otherwise>
    </p:choose>

  </p:declare-step>

  <p:declare-step type="o:createHttpRequest">
    <p:documentation xmlns="http://www.w3.org/1999/xhtml">
      Return c:request element for a parameterized query to <var>baseUrl</var>.  Expects a c:param-set document with all
      request parameters at the primary input port. A request parameter the empty string as value will not be used in
      the request.
    </p:documentation>

    <p:input  port="source" primary="true"/>
    <p:output port="result" primary="true"/>

    <p:option name="baseUrl" required="true"/>

    <p:xslt>
      <p:with-param name="baseUrl" select="$baseUrl"/>
      <p:input port="stylesheet">
        <p:inline>
          <xsl:transform version="2.0"
                         exclude-result-prefixes="#all"
                         xmlns:fun="tag:maus@hab.de,2018-04:XSLT"
                         xmlns:xs="http://www.w3.org/2001/XMLSchema"
                         xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

            <xsl:param name="baseUrl" as="xs:anyURI" required="yes"/>

            <xsl:template match="c:param-set">
              <c:request method="get" href="{$baseUrl}?{string-join(for $p in c:param return fun:encode-pair($p), '&amp;')}"/>
            </xsl:template>

            <xsl:function name="fun:encode-pair" as="xs:string?">
              <xsl:param name="pair" as="element(c:param)"/>
              <xsl:if test="normalize-space($pair/@name) and normalize-space($pair/@value)">
                <xsl:value-of select="concat(encode-for-uri($pair/@name), '=', encode-for-uri($pair/@value))"/>
              </xsl:if>
            </xsl:function>

          </xsl:transform>
        </p:inline>
      </p:input>
    </p:xslt>

  </p:declare-step>

  <p:declare-step type="o:check-response" name="check-response">
    <p:input  port="source" primary="true"/>
    <p:output port="result" primary="true"/>

    <p:choose>
      <p:when test="/oai:OAI-PMH/oai:error">
        <p:identity name="identity"/>
        <p:insert match="oai:error" position="first-child">
          <p:input port="insertion">
            <p:inline><code/></p:inline>
          </p:input>
        </p:insert>
        <p:string-replace match="oai:error/code" replace="concat('[', ../@code, ']')" name="format-errors"/>
        <p:error code="protocol-error">
          <p:input port="source" select="/oai:OAI-PMH/oai:error">
            <p:pipe port="result" step="format-errors"/>
          </p:input>
        </p:error>
      </p:when>
      <p:otherwise>
        <p:identity/>
      </p:otherwise>
    </p:choose>
  </p:declare-step>

</p:library>
