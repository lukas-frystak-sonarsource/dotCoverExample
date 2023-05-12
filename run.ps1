# Constants
$sonarQubeUrl = $env:SONARQUBE_URL
$sonarQubeToken = $env:SONARQUBE_TOKEN
$solution = ".\src\main.sln"
$projectKey = "lukas-frystak-sonarsource_dotCoverExample_AYXeU10iRWnsrqWqXvlh"
$projectName = "dotCoverExample"
$version = "1.0.0"

$coverageReportDirectory = ".\TestResults"
$coverageReportPath = "$coverageReportDirectory\dotCover.Output.html"
# The unit test results are stored in each test project: *Tests\TestResults\*.trx
$testReportPath = ".\**\*.trx"

$branchName = git rev-parse --abbrev-ref HEAD

# =====================================================================================================================================

# Firstly, clean existing test results if any exist. We need to do this as 
# the *.trx report files are not overriden with subsequent test runs, so
# the results would be counted multiple times.
# Clean dotCover test results.
if (Test-Path $coverageReportDirectory) {
    Write-Host "Removing dotCover test results directory (""$coverageReportDirectory"")"
    Remove-Item -Path $coverageReportDirectory -Recurse -Force
} 

# Clear unit test execution results from the respective test projects.
$testResultsDirectories = Get-ChildItem -Path .\**\*Tests\TestResults -Directory
if ($null -ne $testResultsDirectories) {
    Write-Host "Removing test results directories..."
    $testResultsDirectories.FullName | Remove-Item -Recurse -Force
}

# Prepare SonarQube analysis.
dotnet sonarscanner begin `
    /key:$projectKey /name:$projectName /v:$version `
    /d:sonar.host.url=$sonarQubeUrl /d:sonar.login=$sonarQubeToken `
    /d:sonar.cs.dotcover.reportsPaths=$coverageReportPath `
    /d:sonar.cs.vstest.reportsPaths=$testReportPath `
    /d:sonar.verbose=false `
    #/d:sonar.branch.name=1$branchName
    #/d:sonar.pullrequest.branch=test/coverage `
    #/d:sonar.pullrequest.base=main `
    #/d:sonar.pullrequest.key=1

# Build the solution.
dotnet build $solution --configuration Release

# Run tests.
dotnet dotcover test $solution --no-build --configuration Release --dcReportType=html --dcOutput=$coverageReportPath --logger trx

# Run SonarQube code analysis.
dotnet sonarscanner end /d:sonar.login=$sonarQubeToken