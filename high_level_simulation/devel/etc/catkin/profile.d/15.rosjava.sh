
SCRIPT=/home/parallels/tfg/autonomous-vehicles-system-simulation/high_level_simulation/src/rosjava_build_tools/generate_environment_variables.py

export ROS_MAVEN_PATH="`python ${SCRIPT} --maven-path`"
export ROS_MAVEN_DEPLOYMENT_REPOSITORY="`python ${SCRIPT} --maven-deployment-repository`"
export ROS_MAVEN_REPOSITORY="`python ${SCRIPT} --maven-repository`"
