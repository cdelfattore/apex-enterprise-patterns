# Apex Enterprise Pattern Samplecode

This repository contains examples of the Apex Enterprise patterns.

# RecordTypes
Apex class used to provide an interface for interacting with the Schema class when trying to get record type ids for objects. In long running apex processes, it seems to be better to minimize the amount of times the Schema class is called. When gathering record type ids for an object store all the record type ids
