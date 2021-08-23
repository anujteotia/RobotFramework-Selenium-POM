pipeline {
  agent any
  
  stages {
	    stage('Run Robot Tests') {
	      steps {		
		      	sh 'pip3 install requests'
	                sh 'pip3 install robotframework-broser'
	                sh 'rfbrowser init'
		        sh 'python -m robot --NoStatusRC Tests/'
		        sh 'exit 0'
	      		}
	      post {
        	always {
		        script {
		          step(
			            [
			              $class              : 'RobotPublisher',
			              outputPath          : 'reports',
			              outputFileName      : '**/output.xml',
			              reportFileName      : '**/report.html',
			              logFileName         : '**/log.html',
			              disableArchiveOutput: false,
			              passThreshold       : 50,
			              unstableThreshold   : 40,
			              otherFiles          : "**/*.png,**/*.jpg",
			            ]
		          	)
		        }
	  		}		
	    }
	}    
  }
  
}
