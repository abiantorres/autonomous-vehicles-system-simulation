#!/usr/bin/env python

from pymongo import MongoClient
import json, yaml
from bson import json_util

class DBClient():

    def __init__(self):
        # Connect to the mongodb service
        self.client = MongoClient('localhost', 27017)
        # Get the avss db client
        self.db = self.client['avss']
        # Collection which contains some metadata for all
        # simulations configuration
        self.simulations_collection = self.db['simulations_collection']
        # Collection which contains the low level results
        self.low_level_collection = self.db['low_level_collection']

    def msg_to_json(self, msg):
         """ Convert a ROS message to JSON format"""
         y = yaml.load(str(msg))
         return json_util.loads(json.dumps(y,indent=4))

    def insert_simulation_results(self, msg):
        simulation_hash = msg.metadata.simulation_hash
        if(not self.simulations_collection.find_one({"simulation_hash": simulation_hash})):
            self.simulations_collection.insert_one(\
            {"simulation_hash":simulation_hash,\
            "robot_file":msg.metadata.robot_file,\
            "world_file":msg.metadata.world_file,\
            "plan_file":msg.metadata.plan_file,\
            "map_file":msg.metadata.map_file})
        json_format = self.msg_to_json(msg)
        self.low_level_collection.insert_one(json_format)
