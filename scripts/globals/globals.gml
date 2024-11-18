#macro log						show_debug_message

#macro DEV_CONFIG				true
#macro release:DEV_CONFIG		false

#macro MAP_GIRD_SIZE		64
#macro RUNNER_SPEED			2
#macro PASSAGES				3


#macro PATHRUNNER_START_X	384
#macro PATHRUNNER_START_Y	0

if(!DEV_CONFIG) randomize();
