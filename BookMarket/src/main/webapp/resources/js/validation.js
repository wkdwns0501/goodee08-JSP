/**
 * 
 */
function checkAddBook(e) {
	const bookId = document.querySelector("#bookId").value;
	const name = document.querySelector("#name").value;
	const unitPrice = document.querySelector("#unitPrice").value;
	const unitsInStock = document.querySelector("#unitsInStock").value;
	const description = document.querySelector("#description").value;
	// .focus() 나 .select()를 사용하려면 값이 아닌 DOM요소에 써야함
	
	// 도서아이디 체크
	// '[도서 코드]\nISBN과 숫자를 조합하여 8~15자까지 입력하세요.\n첫 글자는 반드시 ISBN으로 시작하세요.'
	// 정규 표현식 사용
	const regExpBookId = /^ISBN[0-9]{4,11}$/;
	
	if (!regExpBookId.test(bookId)){
		alert("[도서 코드]\nISBN과 숫자를 조합하여 8~15자까지 입력하세요.\n첫 글자는 반드시 ISBN으로 시작하세요.")
		e.preventDefault();
		return;
	}
	
	// 도서명 체크
	// '[도서명]\n최소 4자에서 최대 50자까지 입력하세요.'
	if (name.length < 4 || name.length > 50) {
		alert("[도서명]\n최소 4자에서 최대 50자까지 입력하세요.");
		e.preventDefault();
		return;
	}
	
	// 도서 가격 체크
	// '[가격]\n숫자만 입력하세요.'
	if (unitPrice === '' || isNaN(unitPrice) || unitPrice < 0) {
		alert("[가격]\n0이상의 숫자만 입력하세요.");
		e.preventDefault();
		return;
	}
	// '[가격]\n음수를 입력할 수 없습니다.'
	if (unitPrice < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다.");
		e.preventDefault();
		return;
	}
	// (참고) 만약 소수점 이하 최대 2자리까지 허용하는 숫자를 체크하는 정규식
	const regExpUnitPrice = /^\d+(\.\d{1,2})?$/;
	if (!regExpUnitPrice.test(unitPrice)){
		alert("[가격]\n소수점 이하 최대 2자리까지 가능합니다.")
		e.preventDefault();
		return;
	}
	
	// 상세설명 체크
	// '[상세설명]\n최소 100자 이상 입력하세요.'
	if (description === '' || description.length < 100) {
		alert("[상세설명]\n최소 100자 이상 입력하세요.");
		e.preventDefault();
		return;
	}
	
	// 재고 수 체크
	// '[재고 수]\n숫자만 입력하세요.'
	if (unitsInStock.length === 0 || isNaN(unitsInStock)) {
		alert("[재고 수]\n숫자만 입력하세요.");
		e.preventDefault();
		return;
	}
	
}