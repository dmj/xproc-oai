# XProc 1.0 OAI-PMH

Copyright (c) 2018-2020 by David Maus &lt;dmaus@dmaus.name&gt;

This XProc 1.0 library implements the Open Archive Initiative's Protocol for Metadata Harvesting (OAI-PMH). It provides
a single step for each of the protocol operations and is capable of aggregating incomplete list responses to a complete
list response using the protocol's resumption token mechanism.

The library is released under the terms of the GNU General Public License 3.0.

## Error handling

Errors on the protocol level (i.e. reported in the response document) trigger a p:error with the @code protocol-error
and the oai:error elements as content.

## Public interface

### {http://dmaus.name/ns/oai-pmh}Identify

Options: baseUrl (required)

> This verb is used to retrieve information about a repository. Some of the information returned is required as part of
> the OAI-PMH. Repositories may also employ the Identify verb to return additional descriptive information.

### {http://dmaus.name/ns/oai-pmh}ListMetadataFormats

Options: baseUrl (required), identifier (optional)

> This verb is used to retrieve the metadata formats available from a repository. An optional argument restricts the
> request to the formats available for a specific item.

### {http://dmaus.name/ns/oai-pmh}ListSets

Options: baseUrl (required)

> This verb is used to retrieve the set structure of a repository, useful for selective harvesting.

### {http://dmaus.name/ns/oai-pmh}ListRecords

Options: baseUrl (required), metadataPrefix (required), from (optional), until (optional), set (optional)

> This verb is used to harvest records from a repository. Optional arguments permit selective harvesting of records
> based on set membership and/or datestamp. Depending on the repository's support for deletions, a returned header may
> have a status attribute of "deleted" if a record matching the arguments specified in the request has been deleted. No
> metadata will be present for records with deleted status.

### {http://dmaus.name/ns/oai-pmh}ListIdentifiers

Options: baseUrl (required), metadataPrefix (required), from (optional), until (optional), set (optional)

> This verb is an abbreviated form of ListRecords, retrieving only headers rather than records. Optional arguments
> permit selective harvesting of headers based on set membership and/or datestamp. Depending on the repository's support
> for deletions, a returned header may have a status attribute of "deleted" if a record matching the arguments specified
> in the request has been deleted.

### {http://dmaus.name/ns/oai-pmh}GetRecord

Options: baseUrl (required), identifier (required), metadataPrefix (required)

> This verb is used to retrieve an individual metadata record from a repository. Required arguments specify the
> identifier of the item from which the record is requested and the format of the metadata that should be included in
> the record.
