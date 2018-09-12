# ioa-standalone-db
This repository proposes a data model for standalone Automatic Passenger Counting software projects. 

## APC Data Model
The data model is meant to be used for standalone or IoT use cases, whenever APC data is to be transmitted from the fleet into a Cloud-based backend. In the backend the data can be stored persistently in a relational database. There is a CREATE TABLE script available.

The data model consists of the following main components:

* APC Data
* GNSS Data
* Vehicle Data

The proposed model covers vehicle tracking data on the basis of GNSS. During operations, tracking data will be recorded during the whole trip within short intervals (every 10 seconds). APC data, mainly boardings and alightings, is recorded at every stop of a trip. Therefore a GNSS location will not come together with an APC record in any case, but an APC record will always be assigned to a location.
