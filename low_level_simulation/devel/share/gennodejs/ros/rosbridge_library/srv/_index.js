
"use strict";

let TestEmpty = require('./TestEmpty.js')
let TestArrayRequest = require('./TestArrayRequest.js')
let TestRequestAndResponse = require('./TestRequestAndResponse.js')
let TestResponseOnly = require('./TestResponseOnly.js')
let TestNestedService = require('./TestNestedService.js')
let TestMultipleResponseFields = require('./TestMultipleResponseFields.js')
let TestRequestOnly = require('./TestRequestOnly.js')
let AddTwoInts = require('./AddTwoInts.js')
let SendBytes = require('./SendBytes.js')
let TestMultipleRequestFields = require('./TestMultipleRequestFields.js')

module.exports = {
  TestEmpty: TestEmpty,
  TestArrayRequest: TestArrayRequest,
  TestRequestAndResponse: TestRequestAndResponse,
  TestResponseOnly: TestResponseOnly,
  TestNestedService: TestNestedService,
  TestMultipleResponseFields: TestMultipleResponseFields,
  TestRequestOnly: TestRequestOnly,
  AddTwoInts: AddTwoInts,
  SendBytes: SendBytes,
  TestMultipleRequestFields: TestMultipleRequestFields,
};
