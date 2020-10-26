<p:declare-step version="1.0"
                xmlns:o="http://dmaus.name/ns/oai-pmh"
                xmlns:p="http://www.w3.org/ns/xproc">

  <p:output port="result" primary="true" sequence="true"/>

  <p:import href="library.xpl"/>

  <o:ListRecords baseUrl="http://oai.hab.de" metadataPrefix="oai_dc" from="2019-02-01"/>

</p:declare-step>
