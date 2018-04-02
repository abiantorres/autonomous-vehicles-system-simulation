
"use strict";

let AddTwoInts = require('./AddTwoInts.js')
let TestRequestAndResponse = require('./TestRequestAndResponse.js')
let TestRequestOnly = require('./TestRequestOnly.js')
let TestResponseOnly = require('./TestResponseOnly.js')
let TestMultipleRequestFields = require('./TestMultipleRequestFields.js')
let TestMultipleResponseFields = require('./TestMultipleResponseFields.js')
let SendBytes = require('./SendBytes.js')
let TestEmpty = require('./TestEmpty.js')
let TestNestedService = require('./TestNestedService.js')
let TestArrayRequest = require('./TestArrayRequest.js')

module.exports = {
  AddTwoInts: AddTwoInts,
  TestRequestAndResponse: TestRequestAndResponse,
  TestRequestOnly: TestRequestOnly,
  TestResponseOnly: TestResponseOnly,
  TestMultipleRequestFields: TestMultipleRequestFields,
  TestMultipleResponseFields: TestMultipleResponseFields,
  SendBytes: SendBytes,
  TestEmpty: TestEmpty,
  TestNestedService: TestNestedService,
  TestArrayRequest: TestArrayRequest,
};
