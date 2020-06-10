#  프랜차이즈 3사 통합 예매 시스템 "뭅뭅뭅" _ 허지행 

<div>
<img width="1600" alt="mainPage" src="https://user-images.githubusercontent.com/51398029/84228251-81501100-ab21-11ea-9a31-b2f1dd48c46f.png">
   <p align="center">[그림 1]메인페이지</p>
</div>

   기존의 영화 예매사이트에서는 상영시간표와 좌석의 확인을 위해 프랜차이즈 영화 사이트 별로 오가며 비교해야하는 번거로움이 있었습니다. 이러한 불편함을 해소하기 위해 '뭅뭅뭅'은 CGV, 메가박스, 롯데시네마 3사의 예매정보를 한눈에 비교하고, 예매할 수 있는 서비스를 제공합니다.

- - -
## 1. 포트폴리오 자료
   - [개인 포트폴리오 PPT(Slideshare)](https://www.slideshare.net/haengjee/3-232248476)
   - [프로젝트 보고서(PDF)](https://drive.google.com/file/d/1ZmJUZnb07EfoIXLxfyB96BLmANwTlXIB/view?usp=sharing)
   - [전체 구현영상(youtube)](https://youtu.be/8sUll4QXzOY)

## 2. 개   요
* 프로젝트 명 : MovMovMov(뭅뭅뭅)

* 일   정 : 2019.12.24 ~ 2020.03.12

* 총 개발 인원 : 6명

* 시스템 개요 : MVC Model2 아키텍쳐를 기반으로 한 SpringFramework를 이용하여 만든 프랜차이즈 3사 통합 예매 웹 서비스입니다. 저희 서비스는 회원관리, 영화정보관리, 예매관리, 스토어관리, 결제, 이벤트, 고객센터 모듈로 구성되어 있습니다. 그 중에서 영화정보관리와 결제 모듈을 담당하였습니다.

## 3. 담당모듈(영화정보관리, 결제)
   ### <영화정보관리>
   
   - 상영중인 또는 상영예정인 영화들의 정보들과 예매율, 평점, 보고싶어요, 한줄평 등을 관리하는 모듈입니다.
   
   - 영화에 대한 정보는 selenium을 이용하여 크롤링을 통해 Daum 영화에서 상영정보를 얻고, 영화에 대한 상세정보는 한국영화데이터베이스 API를 사용하여 관리하였습니다.
   
   - 평점, 보고싶어요, 한줄평 등은 Ajax를 이용하여 비동기 요청으로 구현하였습니다.
   
   <div>
   <img width="1600" alt="movieList" src="https://user-images.githubusercontent.com/51398029/84229579-e35e4580-ab24-11ea-970f-f6a5d17ff828.png">
   <p align="center">[그림 2]상영작 목록 조회</p>
   <br/>   
   <img width="1600" alt="movieInfo" src="https://user-images.githubusercontent.com/51398029/84229583-e5c09f80-ab24-11ea-9d78-e446fd17af80.png">
   <p align="center">[그림 3]영화 상세 조회</p>
   <br/>
   </div>
   
- - -

   ### <결  제>
   
   - 예매에 대한 결제, 환불, 포인트 적립, 상품권 발행 등을 관리하는 모듈입니다.
   
   - I'mport 결제 API를 사용하여 Paypal, 카카오페이 등 PG사와 연동하여 결제가 가능하도록 구현하였습니다.
   
   - 환불 요청 시, 실제 거래금액, 사용과 적립 포인트, 사용한 상품권을 처리하기 위해 트랜젝션을 구성하여 구현하였습니다.
   
   <img width="1600" alt="payment" src="https://user-images.githubusercontent.com/51398029/84233378-32a87400-ab2d-11ea-801c-c2f108a0884e.png">
   <p align="center">[그림 4]결제 정보 입력</p>
   <img width="1600" alt="paymentByApi" src="https://user-images.githubusercontent.com/51398029/84233114-a6964c80-ab2c-11ea-8f61-892d4df5784f.png">
   <p align="center">[그림 5]결제 API(I'mport) 사용</p>

## 4. 사용 기술 및 개발환경
* O/S : Windows 10 

* FrontEnd : HTML, CSS, Javascript, jQuery, AJAX, BootStrap, summernote, FullCalendar, sweetalert2, Owl-Carousel 2, Moment.js, Font Awesome, Google Fonts

* Back-end : Java, Spring Framework, Apache Tomcat 7, Orcale 10g, MyBatis, JavaMail API

* Programming Language : JAVA(JDK 1.8), HTML, JavaScript 

* Open API : Kakao Developer, Naver Developer, 청기와랩 API, I'MPORT API, Youtube API, 한국영화데이터베이스 API, 영화관입장권통합전산망 API 

* Tool : Github, StarUML, DBeaver, Eclipse, Visual Studio Code, Bracket, OvenApp, Selenium    

<img width="1300" alt="tech00" src="https://user-images.githubusercontent.com/51398029/84234719-a9df0780-ab2f-11ea-8212-e9c49156c9c6.png">
<p align="center">[그림 6]사용기술 및 개발환경 -1</p>
<img width="1300" alt="tech01" src="https://user-images.githubusercontent.com/51398029/84234733-aea3bb80-ab2f-11ea-84cd-643d0c3d84ee.png">
<p align="center">[그림 7]사용기술 및 개발환경 -2</p>

---

