#!/bin/bash
[[ -z ${JAVA_HOME} ]] && echo "Error: JAVA_HOME is not set, please manually install Java jdk 8 https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html and set JAVA_HOME. https://docs.oracle.com/cd/E19182-01/820-7851/inst_cli_jdk_javahome_t/" && exit -1;
if ! command -v git &> /dev/null
then
	echo "Installing git"
	if ! command -v brew &> /dev/null
	then
			/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
	brew install git
fi

if ! command -v mvn &> /dev/null
then
	echo "Installing maven"
	curl https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip  -o apache-maven-3.6.3.zip
	unzip apache-maven-3.6.3.zip


	mv apache-maven-3.6.3 ~

	rm -f apache-maven-3.6.3.zip
	echo export PATH="~/apache-maven-3.6.3/bin:$PATH" >> ~/.bash_profile
	echo export PATH="~/apache-maven-3.6.3/bin:$PATH" >> ~/.zshenv

	source ~/.bash_profile
	source ~/.zshenv
fi

if ! command -v kite_c &> /dev/null
then
	echo "Installing kite"
	git clone https://github.com/webrtc/KITE
	cd KITE
	KITE_HOME=`pwd`
	if [ -n "$(grep "KITE_HOME" ~/.bash_profile)" ]
	then
		echo "Updating KITE_HOME"
		sed -i'' -e '/KITE_HOME/d' ~/.bash_profile 
	fi

	if [ -n "$(grep "KITE_HOME" ~/.zshenv)" ]
	then
		echo "Updating KITE_HOME"
		sed -i'' -e '/KITE_HOME/d' ~/.zshenv
	fi

	echo export KITE_HOME="$KITE_HOME" >> ~/.bash_profile

	if [ -n "$(grep "scripts/mac/path" ~/.bash_profile)" ]
	then
		sed -i'' -e '/scripts/mac/path/d' ~/.bash_profile 

	fi

	echo export KITE_HOME="$KITE_HOME" >> ~/.zshenv

	if [ -n "$(grep "scripts/mac/path" ~/.zshenv)" ]
	then
		sed -i'' -e '/scripts/mac/path/d' ~/.zshenv

	fi


	chmod +x $KITE_HOME/scripts/mac/
	chmod +x $KITE_HOME/scripts/mac/path/*

	chmod +x $KITE_HOME/third_party/allure-2.10.0/bin/allure

	echo export PATH="\$PATH:\$KITE_HOME/scripts/mac/path" >> ~/.bash_profile
	source ~/.bash_profile

	echo export PATH="\$PATH:\$KITE_HOME/scripts/mac/path" >> ~/.zshenv
	source ~/.zshenv

	if [ -n "$(grep "allure-2.10.0/bin" ~/.bash_profile)" ]
	then
		sed -i'' -e '/allure-2.10.0/bin/d' ~/.bash_profile 
	fi

	if [ -n "$(grep "allure-2.10.0/bin" ~/.zshenv)" ]
	then
		sed -i'' -e '/allure-2.10.0/bin/d' ~/.zshenv
	fi

	echo export PATH="\$PATH:\$KITE_HOME/third_party/allure-2.10.0/bin/" >> ~/.bash_profile
	echo export PATH="\$PATH:\$KITE_HOME/third_party/allure-2.10.0/bin/" >> ~/.zshenv

	mvn install
fi
