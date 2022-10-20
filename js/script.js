const elem = document.querySelectorAll('.show-img');
const increaseImg = document.querySelector('.increaseImg');
const counter = document.querySelector('.counter-number');
const buttonSign = document.querySelectorAll('.counter-sign')
let counterNumber=0;

const minus = buttonSign[0];
const plus = buttonSign[1];

elem.forEach(function(element, i, elem){//имя элемента, его номер, массив который перебираем
    element.addEventListener('mouseover', function(){
        increaseImg.src=element.src;})
    }
    ) 

minus.addEventListener('click', function(){
    let content = Number(counter.textContent);
    if(content!=0){
        counter.innerHTML=content-1;
    }  

})

plus.addEventListener('click', function(){
    let content = Number(counter.textContent);
    if(content!=100){//просто потому что людям не нужно больше 100 одинаковых рубашек
        counter.innerHTML=content+1;
    }  
})


/*function buyFunction(){ //ну это чисто js
    let content = Number(counter.textContent);//взяли текущее число выбранных вещей
    alert('В корзину добавлено '+ content + ' товаров')
    noty({text: 'noty - это jquery плагин для сообщений!'});
}*/



$('.product_button').on('click', function(){
    let content = Number(counter.textContent);
    noty({text: 'В корзину добавлено '+ content + ' товаров'});
});