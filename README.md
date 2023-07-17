# Instagram Clone Application, DamSo SNS - Java/CLI

<div align="center">
<img width="150" alt="image" src="https://github.com/olo02/AWS_fullstack_semi_project_SNS/assets/121186383/3308b340-d071-40ce-8532-55d97364bc8a">

[데모 사이트 바로가기](http://damso.olooe.city)

</div>

<br>

---

## 프로젝트 소개

> **AWS 풀스택 개발자 양성과정 세미 프로젝트** <br/> > **개발기간: 2022.03.24 ~ 2022.04.** <br>
> Demo Site : http://damso.olooe.city

풀스택 개발자 과정 세미 프로젝트로 '담소' Web 개발 프로젝트를 진행하였습니다. 담소는 인스타그램 클론 애플리케이션으로, 인스타그램의 기본적인 기능에 네이버 밴드의 기능을 접목한 SNS 웹 애플리케이션입니다.

본 프로젝트는 Spring Legacy 구조의 이해도를 높이는 것에 초점을 두었고, SNS의 특성상 필수적인 REST API를 통한 비동기 피드 구현 및 Web Socket을 사용한 채팅과 알림의 구현을 목표로 삼았습니다.

Spring과 JSP를 사용하여 개발을 진행하였고, DataBase는 MariaDB를 이용하였습니다.

---

## 시작 가이드

### Requirements

For building and running the application you need:

- [Java 1.8](https://www.oracle.com/java/technologies/downloads/#java17)
- <details markdown="1">
    <summary>DataBase 연결 - application-datasource.yml 추가</summary>

  ```
  spring:
      datasource:
          driver-class-name: org.mariadb.jdbc.Driver
      username: 계정이름
      password: 계정비밀번호
      url: 계정url
  ```

    </details>

### Installation

```bash
$ git clone https://github.com/olo02/AWS_fullstack_semi_project_SNS.git
```

---

## 설계

### Stacks

- #### Environment

    <img src="https://img.shields.io/badge/intellijidea-000000?style=for-the-badge&logo=intellij Idea&logoColor=white">
    <img src="https://img.shields.io/badge/subversion-809CC9?style=for-the-badge&logo=subversion&logoColor=white">

- #### Language

  <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">

- #### Framework & Library

    <img src="https://img.shields.io/badge/Spring MVC-6DB33F?style=for-the-badge&logo=spring&logoColor=white">   
    <img src="https://img.shields.io/badge/Spring Security-6DB33F?style=for-the-badge&logo=Spring Security&logoColor=white">
    <img src="https://img.shields.io/badge/Java Servlet-FF7800?style=for-the-badge&logoColor=white">
    <img src="https://img.shields.io/badge/JSP-black?style=for-the-badge&logoColor=white">
    <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
    <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">

- #### DataBase

    <img src="https://img.shields.io/badge/mariaDB-003545?style=for-the-badge&logo=mariaDB&logoColor=white">

- #### Infrastructure

    <img src="https://img.shields.io/badge/Amazon EC2-FF9900?style=for-the-badge&logo=Amazon EC2&logoColor=white">
    <img src="https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=Nginx&logoColor=white">
    <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">

### 요구사항

[요구사항 정의서 작업문서](https://docs.google.com/spreadsheets/d/1Dofu9ugGKLxQQulQ4o6Gfn1cHgOCtG88HjmJctyVSfI/edit?pli=1#gid=0)

### ERD

<div align="center">
<img width="400" alt="image" src="https://github.com/olo02/AWS_fullstack_semi_project_SNS/assets/121186383/ca6e13bb-95e7-41c6-a8f8-909c0dfc0b8f">
</div>

---

## 주요 화면 구성

<div align="center">

|                                                                회원가입                                                                |                                                                 로그인                                                                 |
| :------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------: |
| <img width="250" src="https://github.com/olo02/AWS_fullstack_semi_project_SNS/assets/121186383/16cd2363-793f-4eee-89ae-1178683962bc"/> | <img width="250" src="https://github.com/olo02/AWS_fullstack_semi_project_SNS/assets/121186383/56ef9fb1-49e5-4579-a454-50c847193dc1"/> |
|                                                               메인 피드                                                                |                                                               모임 피드                                                                |
| <img width="500" src="https://github.com/olo02/AWS_fullstack_semi_project_SNS/assets/121186383/4a9aec45-4628-4ea9-88c1-0f3bc219c4be"/> | <img width="500" src="https://github.com/olo02/AWS_fullstack_semi_project_SNS/assets/121186383/b287ce22-6198-4451-9194-1da33c93b82a"/> |
|                                                                  채팅                                                                  |                                                                  알림                                                                  |
| <img width="500" src="https://github.com/olo02/AWS_fullstack_semi_project_SNS/assets/121186383/985d4d4f-7300-4ffd-83f9-11970a64a2cb"/> |                                                              알림 이미지                                                               |
|                                                              마이 페이지                                                               |                                                                글 작성                                                                 |
| <img width="500" src="https://github.com/olo02/AWS_fullstack_semi_project_SNS/assets/121186383/d4a25884-933c-4ccb-9ab9-60354c470a1d"/> | <img width="500" src="https://github.com/olo02/AWS_fullstack_semi_project_SNS/assets/121186383/11023490-352b-47a8-85b7-c66ad324a0cb"/> |

</div>

---

## 주요 기능

### ⭐️ 메일 인증 회원 가입

### ⭐️ 자동 로그인

### ⭐️ 실시간 채팅

### ⭐️ 실시간 알림

### ⭐️ SNS형 비동기 피드 게시판

### ⭐️ 무한 스크롤 피드

### ⭐️ 모임

---

## 아키텍쳐

### 디렉토리 구조

```bash
├── src
│   ├── main
│   │   ├── java/city/olooe
│   │   │     ├── controller
│   │   │     ├── domain
│   │   │     ├── handler : 웹소켓 설정
│   │   │     ├── interceptor : 세션 및 쿠키 설정
│   │   │     ├── mapper
│   │   │     └── service
│   │   ├── resources
│   │   │     ├── city.olooe.mapper : mybatis 이용 DataBase 쿼리 설정
│   │   │     ├── log4j.xml
│   │   │     ├── jdbc.properties : DataBase 연결 설정 (추가 필요)
│   │   │     └── log4jdbc.log4j2.properties
│   │   └── webapp : front
│   │        ├── WEB-INF
│   │        │   ├── spring
│   │        │   │   ├── appServlet
│   │        │   │   └── root-context.xml
│   │        │   ├── views
│   │        │   │   ├── board : 피드 jsp
│   │        │   │   ├── club : 모임 jsp
│   │        │   │   ├── layout : header 및 footer
│   │        │   │   ├── member : 회원 jsp
│   │        │   │   └── message : 메시지 jsp
│   │        │   └── web.xml : web config 및 filter 설정
│   │        └── resources
│   └── test/resources
├── .gitignore
└── pom.xml : dependency 설정

```

---

## 개발팀 소개

<div align="center">

|                                   김설하(팀장)                                   |    박현민     |                                      김민수                                       |
| :------------------------------------------------------------------------------: | :-----------: | :-------------------------------------------------------------------------------: |
| <img width="160px" src="https://avatars.githubusercontent.com/u/93528672?v=4" /> |               | <img width="160px" src="https://avatars.githubusercontent.com/u/113892151?v=4" /> |
|                     [@seolha86](https://github.com/seolha86)                     |   @hyunmin    |              [@KimMinSoocoding](https://github.com/KimMinSoocoding)               |
|                        - 게시글 서비스 <br> - 알림 서비스                        | - 댓글 서비스 |                                   - 회원 서비스                                   |

|                                                               천은경                                                               |    강태수     |     |
| :--------------------------------------------------------------------------------------------------------------------------------: | :-----------: | :-: |
| <img height="160px" src="https://user-images.githubusercontent.com/121186383/242636171-4e873ee3-bb3e-4961-806a-2f960c7210d1.jpg"/> |               |     |
|                                                 [@olo02](https://github.com/olo02)                                                 |    @taesu     |     |
|                                                  - 모임 서비스 <br> - 채팅 서비스                                                  | - 친구 서비스 |     |

</div>

---

## 프로젝트 후기

```
비동기 방식 및 spring에 대한 구현 경험이 적어 부담도 느꼈지만, 오히려 부족한 부분을 채울 수 있었습니다.
설계한 모든 기능을 구현할 수는 없었기에 아쉽지만,
다대다 테이블 관계와 비동기 방식 및 웹 소켓에 대한 이해도를 높일 수 있었고 팀 프로젝트에서의 협업 등 전체적으로 폭넓게 성장할 수 있었습니다.
```

<br>

---

## References

**참고 사이트**

- [Instagram](https://www.instagram.com/)
- [BAND](https://band.us/ko)

README Template : [parkjiye](https://velog.io/@luna7182/%EB%B0%B1%EC%97%94%EB%93%9C-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-README-%EC%93%B0%EB%8A%94-%EB%B2%95) <br>
Hit : [hit](https://hits.seeyoufarm.com/)
