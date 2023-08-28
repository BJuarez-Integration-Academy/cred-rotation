import json, os,requests

personalAccessToken = os.environ['GITHUB_TOKEN']
ORG_NAME = os.environ['GITHUB_OWNER']

################################-Initializing global vars-##############################################
token = "Bearer " + personalAccessToken
header = {
    "X-GitHub-Api-Version": "2022-11-28",
    "Authorization": token
}
        
#################################-Trigger Workflow Function-#################################
def triggerWorkflow(repoName: str,env:str):
    url = "https://api.github.com/repos/"+ORG_NAME+"/"+repoName+"/actions/workflows"
    getResp = requests.get(url, headers = header)
    if getResp.status_code == 200:
        print("===>Triggering ["+repoName+ "] repo...")
        getResp = json.loads(getResp.text) 
        wfId=getResp['workflows'][0]['id']
        url = "https://api.github.com/repos/"+ORG_NAME+"/"+repoName+"/actions/workflows/"+str(wfId)+"/dispatches"
        request = {
            "ref": env
        }
        response = requests.request("POST",url,headers=header,data=json.dumps(request))
        if response.status_code == 204 :
            print("====> Status: Wf Triggered Successfully")
        else: print("Error while triggering the workflow from repo: "+ repoName)
    else: print("Error while getting workflow ID from repo: "+ repoName)