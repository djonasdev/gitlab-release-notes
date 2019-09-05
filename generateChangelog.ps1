# GitLab Changelog Generator with release notes
# Author:Dominic Jonas

# this script generates a simple changelog with the GitLab release notes
# please modify the varaibles in the setup section

#####################################
# PARAMETER                         #
#####################################

param([string]$token, [string]$projectID)

#####################################
# Setup                             #
#####################################

$repoURL = 'https://gitlab.example.com'

#####################################
# Functions                         #
#####################################

Function SendWebRequest($request) {
    $header = @{"PRIVATE-TOKEN"=$token}
    $response = Invoke-WebRequest -Uri $request -Headers $header

    # fix encoding
    $encoded = [system.Text.Encoding]::UTF8.GetString($response.RawContentStream.ToArray()) | ConvertFrom-Json
    return $encoded
}

#####################################
# Logic                             #
#####################################

# get repo informations
$repoJson = SendWebRequest($repoURL + '/api/v4/projects/' + $projectID)

# get release informations
$releasesJson = SendWebRequest($repoURL + '/api/v4/projects/' + $projectID + '/releases?per_page=100')


# DEBUG print complete response
#echo $repoJson

# DEBUG print response object
#echo $repoJson.psobject

echo Changelog
echo $repoJson.psobject.properties["name"].value
echo $repoJson.psobject.properties["description"].value
echo ----------------------

# for loop foreach release
foreach($r in $releasesJson){
    echo ''
    echo $r.name
    echo $r.description
}

