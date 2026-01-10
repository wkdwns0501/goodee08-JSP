USE bookmarketdb;

CREATE TABLE board (
	num INT AUTO_INCREMENT,         -- 게시글 순번
	id VARCHAR(10) NOT NULL,        -- 회원 아이디
	name VARCHAR(10) NOT NULL,      -- 회원 이름
	subject VARCHAR(100) NOT NULL,  -- 게시글 제목
	content TEXT NOT NULL,          -- 게시글 내용
	regist_day VARCHAR(30),         -- 게시글 등록 일자(실무에서는 DATETIME 권장)
	hit INT,                        -- 게시글 조회 수
	ip VARCHAR(20),                 -- 게시글 등록 시 IP
	PRIMARY KEY (num)
);

SELECT * FROM board;
DESC board;
DROP TABLE board;


INSERT INTO board (id, name, subject, content, regist_day, hit, ip) 
VALUES
	('user01', '홍길동', '첫 번째 게시글입니다', '게시판 테스트용 첫 번째 글입니다.', '2026-01-01 10:00', 3, '192.168.0.1'),
	('user02', '김철수', 'JSP 게시판 질문', 'JSP와 서블릿으로 게시판을 구현하고 있습니다.', '2026-01-01 10:10', 5, '192.168.0.2'),
	('user03', '이영희', '페이징 처리 방법', 'LIMIT와 OFFSET을 사용한 페이징 예제입니다.', '2026-01-01 10:20', 8, '192.168.0.3'),
	('user04', '박민수', '검색 기능 구현', 'LIKE 조건을 활용한 검색 기능 테스트.', '2026-01-01 10:30', 2, '192.168.0.4'),
	('user05', '최지은', '게시글 수정 관련', '게시글 수정 기능을 구현 중입니다.', '2026-01-01 10:40', 1, '192.168.0.5'),
	('user06', '정우성', '삭제 기능 문의', '게시글 삭제 로직에 대한 질문입니다.', '2026-01-01 10:50', 4, '192.168.0.6'),
	('user07', '한지민', 'MVC 패턴 적용', 'JSP/Servlet MVC2 패턴 적용 예시.', '2026-01-01 11:00', 6, '192.168.0.7'),
	('user08', '오세훈', 'DAO 설계 질문', 'DAO 싱글톤 패턴에 대해 궁금합니다.', '2026-01-01 11:10', 9, '192.168.0.8'),
	('user09', '윤아', 'PreparedStatement 사용법', '동적 쿼리 작성 시 주의사항.', '2026-01-01 11:20', 7, '192.168.0.9'),
	('user10', '서강준', '게시판 마무리', '게시판 프로젝트를 마무리합니다.', '2026-01-01 11:30', 0, '192.168.0.10');