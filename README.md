🚀 AWS CI/CD Pipeline – Jenkins + GitHub + Tomcat
📌 Overview1

This project demonstrates an end-to-end CI/CD pipeline built on AWS using Jenkins, GitHub, and Apache Tomcat. The pipeline automates build and deployment of a Java web application (WAR) with zero manual intervention.

🏗️ Architecture
Source Control: GitHub
CI/CD Tool: Jenkins
Build Tool: Maven
Application Server: Apache Tomcat 9
Infrastructure: AWS EC2 (Linux)
🔄 Pipeline Flow
Developer → Git Push → GitHub Webhook → Jenkins Build → Maven Package → WAR → Tomcat Deployment → Live Application
⚙️ Infrastructure Setup
2 EC2 Instances:
Jenkins Server
Application Server (Tomcat)
Security Groups:
Port 22 (SSH)
Port 8080 (Jenkins / Tomcat)
🔧 Tools & Technologies
AWS EC2
Jenkins
Git & GitHub Webhooks
Maven
Apache Tomcat
Linux
🛠️ Implementation Steps
1. Server Setup
Launch EC2 instances
Install Java (JDK)
Configure security groups
2. Jenkins Setup
Install Jenkins
Install required plugins:
Git Plugin
Maven Integration Plugin
Deploy to Container Plugin
3. GitHub Integration
Add SSH key to GitHub

Configure webhook:

http://<jenkins-ip>:8080/github-webhook/
4. Build Configuration
Configure Jenkins job:
Source Code Management → GitHub repo
Branch → main
Build Step → mvn clean install
5. Deployment
Configure Tomcat users:
manager-script role
Deploy WAR file to Tomcat server
📊 Key Features
Automated CI/CD pipeline
Webhook-based trigger (no manual build)
WAR deployment to Tomcat
Branch-based deployment workflow
🚧 Challenges Faced
Jenkins ↔ GitHub webhook connectivity issues
Tomcat role configuration (manager-script)
Port conflicts and security group misconfigurations
Debugging failed Maven builds
📈 Improvements (Next Steps)
Add Docker for containerization
Integrate Kubernetes for orchestration
Implement monitoring (Prometheus + Grafana)
Add rollback strategy for failed deployments


Jenkins Multi-Node CI/CD with Tomcat Deployment
📌 Overview 2
This project demonstrates a CI/CD pipeline using Jenkins with two dedicated nodes:
- Dev Node → Deploys applications from the dev GitHub repository to a Tomcat server running in the development environment.
- Prod Node → Deploys applications from the prod GitHub repository to a Tomcat server running in the production environment.
The setup ensures environment isolation, automated builds, and continuous delivery with zero manual intervention.

⚙️ Infrastructure Setup
- Jenkins Master: Orchestrates pipelines and manages nodes.
- Nodes:
- jenkins-dev-node: Connected to Jenkins master, configured to deploy to Dev Tomcat.
- jenkins-prod-node: Connected to Jenkins master, configured to deploy to Prod Tomcat.
- Servers:
- dev-server: Runs Tomcat for development deployments.
- prod-server: Runs Tomcat for production deployments.

🚀 Pipeline Workflow
- Source Control
- Dev code → github.com/<org>/<dev-repo>
- Prod code → github.com/<org>/<prod-repo>
- Build Stage
- Jenkins pulls latest code from respective GitHub repos.
- Maven/Gradle builds WAR files.
- Deploy Stage
- Dev Node copies WAR → /opt/tomcat/webapps/devapp/ on Dev server.
- Prod Node copies WAR → /opt/tomcat/webapps/prodapp/ on Prod server.
- Tomcat auto-deploys updated applications.
- Verification
- Jenkins pipeline runs smoke tests (HTTP 200 check).
- Notifications sent on success/failure.

📊 Achievements
- Environment isolation: Separate GitHub repos and Jenkins nodes for dev vs prod.
- Zero manual deployment: Jenkins pipelines handle build + deploy end-to-end.
- Fast rollback: Previous WARs retained for quick redeployment.
- Scalable design: Additional nodes can be added for staging/UAT environments.

▶️ Usage
- Trigger pipeline manually or via GitHub webhook (pollSCM or webhook).
- Monitor build logs in Jenkins dashboard.
- Access deployed apps:
- Dev → http://<dev-server>:8080/devapp/
- Prod → http://<prod-server>:8080/prodapp/

📜 Notes
- Ensure Jenkins nodes have SSH access to respective servers.
- Tomcat must be configured with correct permissions for Jenkins user.
- Use credentials binding in Jenkins for secure GitHub + server authentication.




🧠 Learnings
End-to-end CI/CD pipeline setup without managed services
Debugging real-world deployment issues
Importance of automation in reducing deployment time
