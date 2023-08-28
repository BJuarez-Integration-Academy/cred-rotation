import json,os,glob
import localModule as lm

rpath = os.environ['GITHUB_ROOT_DIR']
print("GITHUB_ROOT_DIR: " + rpath)

#Getting the .json file name
files = glob.glob("*.json")

#Getting the environment from the file name
env = files[0].split("_")
env = env[1].split(".")
env = env[0]
print("\n====>Executing on [" + env + "] environment\n")
print("Processing [" +files[0]+"] file")

#Reading decrypted file
with open(rpath + "/main/"+files[0]) as f:
    payload = json.load(f)
        
#Triggering git actions workflows
for repo in payload['reposToTrigger']:
    lm.triggerWorkflow(repo,env)
