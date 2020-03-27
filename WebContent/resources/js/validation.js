function checkAddProduct() {
    var productId = document.getElementById("productId");
    var name = document.getElementById("name");
    var unitPrice = document.getElementById("unitPrice");
    var unitsInStock = document.getElementById("unitsInStock");

    var productIdMsg = "[상품 코드]\nP와 숫자를 조합하여 5~12자 까지 입력하세요.\n첫 글자는 반드시 대문자 P로 시작하세요.";
    var nameMsg = "[상품명]\n최소 4자에서 최대 12자 까지 입력하세요.";
    var unitPriceMsg = "[가격]\n숫자만 입력하세요.";
    var unitPriceMinusMsg = "[가격]\n음수는 입력할 수 없습니다.";
    var unitPriceDecimalMsg = "[가격]\n소수점 둘째 자리까지만 입력하세요."
    var unitInStockMsg = "[재고 수]\n숫자만 입력하세요.";

    var productIdRegExp = /^P[0-9]{4,11}$/;
    var unitPriceDecimalRegExp = /^\d+(?:[.]?[\d]?[\d])?$/

    function check(regExp, inputElement, msg) {
        if (regExp.test(inputElement.value)) {
            return true;
        }
        alert(msg);
        inputElement.select();
        inputElement.focus();
        return false;
    }

    // 상품 아이디 체크.
    if (!check(productIdRegExp , productId , productIdMsg)) {
        return false;
    }

    // 상품명 체크.
    if (name.value.length < 4 || name.value.length > 12) {
        alert(nameMsg);
        name.select();
        return false;
    }

    // 상품 가격 체크.
    if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
        alert(unitPriceMsg);
        name.select();
        return false;
    }

    if (unitPrice.value < 0) {
        alert(unitPriceMinusMsg);
        unitPrice.select();
        unitPrice.focus();
        return false;
    } else if (!check(unitPriceDecimalRegExp, unitPrice, unitPriceDecimalMsg)) {
        return false;
    }

    // 재고 수 체크.
    if (isNaN(unitsInStock.value)) {
        alert(unitInStockMsg);
        unitsInStock.select();
        unitsInStock.focus();
        return false;
    }

    document.newProduct.submit();
}