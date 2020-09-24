function git_repo_delete(){ 
  curl -vL \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -X DELETE https://api.github.com/repos/$1 \
    | jq .
}

repos=$( cat ~/dev/repo-bulk-delete/repoList.txt) 
for repo in $repos; do (git_repo_delete "$repo"); done

***************************************************
-v = verbose; show request and response header info
-L = follow redirects if there are any
-H = specify header info
-X = specify request type
***************************************************
$TOKEN = Github -> Settings -> Developer settings -> Personal Access Tokens
