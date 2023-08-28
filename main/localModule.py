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
    
#################################-Deleting file from a REPO Function-#################################
def deleteFileFromRepo(repoName:str,branchName:str):
    url = "https://api.github.com/repos/"+ORG_NAME+"/"+repoName+"/contents/main?ref="+branchName
    getResp = requests.get(url, headers = header)
    if getResp.status_code == 200:
        getResp = json.loads(getResp.text)            
        respoContent = [content for content in getResp if str(content['name']).endswith(".json.gpg")]
        if len(respoContent) > 0:
            ReqBody = {
                "message": "Deleting gpg file for security reasons",
                "committer": {
                    "name": "Python CRED Rotation",
                    "email": "everardofq@gmail.com"
                },
                "sha": respoContent[0]['sha'],
                "branch": branchName
            }
            url = "https://api.github.com/repos/"+ORG_NAME+"/"+repoName+"/contents/"+respoContent[0]['path']
            getResp = requests.delete(url, headers = header,data=json.dumps(ReqBody))
            print("===>Deleting gpg file for security reasons")
            if getResp.status_code == 200:
                print(respoContent[0]['name']+" file deleted successfully")
            else:
                print("Error while deleting ["+respoContent[0]['name']+"] file")
                print("Error Message: "+getResp.text)
        else: print(".gpg file not foun on ["+repoName+"] repo")
        
    else:
        print("Error when listing the content of the repo: "+repoName)
        print(getResp.text)
        
        
        