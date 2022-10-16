let elem = document.querySelectorAll('.show-img');
let increaseImg = document.querySelector('.increaseImg');

elem.forEach(function(element, i, elem){//имя элемента, его номер, массив который перебираем
    element.addEventListener('mouseover', function(){
        increaseImg.src=element.src;})
    }
    ) 
