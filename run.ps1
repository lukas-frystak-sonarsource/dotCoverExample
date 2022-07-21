# Constants
$sonarQubeUrl = $env:SONARQUBE_URL
$sonarQubeToken = $env:SONARQUBE_TOKEN
$solution = ".\src\main.sln"
$projectKey = "example:dotCover"
$projectName = "Example: dotCover .NET Coverage"
$version = "1.0.0"

$coverageReportPath = ".\TestResults\dotCover.Output.html"
$testReportPath = ".\TestResults\testResults.trx"

# Prepare analysis
dotnet sonarscanner begin `
    /key:$projectKey /name:$projectName /v:$version `
    /d:sonar.host.url=$sonarQubeUrl /d:sonar.login=$sonarQubeToken `
    /d:sonar.cs.dotcover.reportsPaths=$coverageReportPath `
    /d:sonar.cs.vstest.reportsPaths=$testReportPath `
    /d:sonar.verbose=false

# Build the solution
dotnet build $solution --configuration Release

# Run tests
dotnet dotcover test $solution --no-build --configuration Release --dcReportType=html --dcOutput=$coverageReportPath --logger "trx;logfilename=$testReportPath"

# Run code analysis
dotnet sonarscanner end /d:sonar.login=$sonarQubeToken