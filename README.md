# MeaningFarm

#### kh 정보교육원에서 진행한 팀 프로젝트
<p>
지역농산물 및 특산품 판매 쇼핑몰 입니다.<br />
최근 가치소비를 중시하는 "Meaning Out" 이라는 용어에서 파생되었습니다.<br />
Meaning Farm 은 지역특산품을 소개하고, 소비를 진작하여 지역경제 활성화라는 가치를 추구합니다.
</p>

## Description
- #### 개발 기간　　| 2022.10.03 ~ 22.11.16 (약 6주)
- #### 참여 인원　　| 5명
- #### 기록　　　　 | 📒 <a href="https://messenger-kh.notion.site/86c8876e465c4caa8703e6c844bf3a48">Notion </a> 
  > ###### 규칙 & 회의록 & 트러블슈팅(버그) & 진행상황</span> & 개인작업
- #### 프로젝트설계 | 📗 <a href="https://docs.google.com/spreadsheets/d/16wqsdkrnTY0lv9_ZsNfPKA1qyX4L-sSRlwvjXk741II/edit?usp=sharing">Google Sheets </a><br />
  > ###### 요구사항정의서 & 클래스설계 & 공정표
- #### 화면정의서　 | 🎨 <a href="https://www.figma.com/file/Samba0znr2Yde8c1d7UDPf/kh%ED%8C%8C%EC%9D%B4%EB%84%90%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8?t=qAPUDJqspk7fZXH3-1">Figama </a><br />
  > ###### [ 화면이동 : 마우스휠 ] & [ 화면 줌 : Ctrl + 마우스휠 ]
- #### PPT영상 　　 | 🔊 <a href="https://youtu.be/CecmMgAr4_E">Youtube
- #### 개발 환경 및 사용기술
    <table>
      <tr align=center>
        <th rowspan="2">개발환경</th>
        <th colspan="3">사용기술</th>
      </tr>
      <tr align=center>
        <th>백앤드</th>
        <th>프론트앤드</th>
        <th>협업툴</th>
      </tr>
      <tr>
        <td>Eclipse 4.0.0</td>
        <td>Java 11.0.10</td>
        <td>JavaScript</td>
        <td>GitHub</td>
      </tr>
      <tr>
        <td>Visual Studio Code</td>
        <td>Oracle DB 11.5.0</td>
        <td>BootStrap 5.2.2</td>
        <td>Notion</td>
      </tr>
      <tr>
        <td>Apache Tomcat 9.0.43</td>
        <td>Spring 4.0</td>
        <td>HTML5/CSS</td>
        <td>Figma</td>
      </tr>
      <tr>
        <td>Mybatis</td>
        <td></td>
        <td>Jquery</td>
        <td>Slack</td>  
      </tr>
      <tr>
        <td>Window OS</td>
        <td></td>
        <td>Ajax</td>
        <td>ERDcloud</td>
      </tr>
    </table>
    
    ![개발환경](https://user-images.githubusercontent.com/98031858/205435270-23a6037c-7070-4dbc-ab68-5542cff76fa1.jpg)

  
- #### 담당 구현 업무
  - 프로젝트 개발환경 구축 및 설계 참여
  - 상품 목록 페이지
  - 상품 상세 페이지
  - 장바구니 
  - GitHub repository 관리
    - Git Merge를 통한 소스통합

## Implements
### 상품 목록 및 상품상세 페이지
  - 상품리스트 데이터 조회 <br />
  - 상품 클릭시 해당 상품페이지로 이동
  
  ![상품리스트_상품상세_AdobeExpress](https://user-images.githubusercontent.com/98031858/206074881-6aa2e0b3-2086-406e-ad17-a89b91840b9c.gif)

### 장바구니
#### 장바구니 삭제
  - Ajax 통신을 이용한 비동기 삭제 처리 <br />
    - 체크박스 선택 후, 삭제 버튼 클릭
  
  ![장바구니_삭제_AdobeExpress](https://user-images.githubusercontent.com/98031858/206076533-db185b82-4005-43ff-9e1c-0c175a87dbe1.gif)

#### 장바구니 추가 및 수량변경
  - Ajax 통신을 이용한 장바구니 상품 추가 및 수량 변경
  
  ![장바구니_추가및수정_AdobeExpress](https://user-images.githubusercontent.com/98031858/206076539-75918ac5-af39-45db-8f86-1b33e6a0979b.gif)

---
    
### ERD(Entity Relationship Diagram) : ERwin 툴사용 
  ![Meaning Farm](https://user-images.githubusercontent.com/98031858/202108666-c7389c85-ce1d-427c-8e0e-ab38d89e7bcb.jpg)

### 클래스설계
  ![image](https://user-images.githubusercontent.com/98031858/205436518-d9077613-d152-4813-ba0a-f1f886c4606b.png)

### 요구사항정의서  
  ![image](https://user-images.githubusercontent.com/98031858/205438707-7181a591-f142-4567-8c0d-3d531c02dc2e.png)

### 공정표
  ![image](https://user-images.githubusercontent.com/98031858/205438044-575c883b-2cef-43c0-9cae-5a1797a315bb.png)


