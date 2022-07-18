# Catch A Cat
![catchacat](https://user-images.githubusercontent.com/97426362/179360371-db69e029-5dc9-4ffc-93c1-9daddf711742.gif)
- 간단한 게임을 할 수 있는 웹 사이트
- 화면의 고양이를 누르면 성공/실패 결과를 확인할 수 있다.
- 실패 결과가 나오면 게임이 중단된다.
- 성공이면 1~99까지의 홀수 중 무작위의 숫자가 점수로 더해지고 게임을 계속 할 수 있다.
  - 성공이면 화면에 랜덤 고양이 사진이 출력된다. 
- 이름과 점수를 데이터베이스에 저장하고, 5위까지의 랭킹을 확인할 수 있다.
  - 올바르지 않은 이름 입력에 대해서는 유효성 체크 메시지가 출력된다.

## 프로젝트 목표 Project Aim
Spring Boot 웹 프로젝트 개발 프로세스를 토이프로젝트를 통해 간단하게 실습하고 이해하고자 함

## 📅 개발 기간 Development Period (in progress)
### 2022.07.16
### (2022.07.16 기준) 차후 보완 예정
- Random cat api로 이미지 불러오는 속도 느린 것 해결하기
- 성공 화면에서 새로고침 방지하기
- 고양이 사진 크기 반응형으로 수정

## 💻 개발 환경 Development Environment
- OS :  Window 10 64bit
- WAS : Apache Tomcat 9.0.64
- IDE : Eclipse 2021-12 (4.22.0)
- Language : Java 17.0.2
- Framework : Spring Boot 2.6.9
- Build : Maven
- DB : Oracle 21c EE (JDBC : ojdbc 11)
- Browser Support : Chrome
- HTML , CSS, Javascript with BootStrap 5.2.0, jQuery 3.6.0
- Version Management : Git, Github  

## 🔗 Used API
- Random cat  
http://random.cat/view/1157
