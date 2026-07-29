/*game code*/
const gameFrame = document.getElementById('gameFrame');
const loadingScreen = document.getElementById('loadingScreen');
const fullscreenBtn = document.getElementById('fullscreenBtn');
const playerWrapper = document.getElementById('playerWrapper');
const startScreen = document.getElementById('startScreen');
const startBtn = document.getElementById('startBtn');

startBtn.addEventListener('click', () => {
  
  startScreen.classList.add('hidden');
  loadingScreen.classList.remove('hidden');

  //!!! instalarea jocului<3!!!
  gameFrame.src = 'game/index.html';
});


gameFrame.addEventListener('load', () => {
  loadingScreen.classList.add('hidden');
});


setTimeout(() => {
  loadingScreen.classList.add('hidden');
}, 5000);


fullscreenBtn.addEventListener('click', () => {
  if (!document.fullscreenElement) {
    if (playerWrapper.requestFullscreen) {
      playerWrapper.requestFullscreen();
    } else if (playerWrapper.webkitRequestFullscreen) {
      playerWrapper.webkitRequestFullscreen();
    }
  } else {
    if (document.exitFullscreen) {
      document.exitFullscreen();
    } else if (document.webkitExitFullscreen) {
      document.webkitExitFullscreen();
    }
  }
});


/*pastrare de pagina*/


window.addEventListener('load', () => {
  window.scrollTo(0, 0);
});

setTimeout(() => {
  window.scrollTo(0, 0);
}, 300);


/*test -intrebari/ raspunsuri*/
const quizData = [
  {
    question: "Cine este detinatorul hanului?",
    answers: ["Ana;", "Ghita;", "Soacra;"],
    correctIndex: 1,
    explanation: "Hanul a fost cumparat de Ghita, el devenind carciumar, iar Ana carciumita."
  },
  {
    question: "Cine este Lica??",
    answers: ["seful tuturor;", "Arandasul de la care s-a imprumutat Ghita.", "Porcar malefic;"],
    correctIndex: 2,
    explanation: "Lica samadaul este un porcar, o persoana care intrepinde activitati financiare ilegale."
  },
  {
    question: "Ce starneste caderea morala a lui Ghita? ",
    answers: ["O inseala pe Ana.", "Da bani pe caini rai, slugi si pistoale.", "Accepta intelegera cu Lica."],
    correctIndex: 2,
    explanation: "Lica accepta termenii lui Ghita, el devinind partener in crima, jaf si furt cu Lica."
  },
  {
    question: "Ghita se cearta cu Ana pentru ca: ",
    answers: ["Ana nu se mai simte in siguranta.", "Ghita a uiat de aniversarea lor.", "Ea vrea sa plece in concubinaj cu Lica."],
    correctIndex: 0,
    explanation: "Ana observa schimbarea lui Ghita, decaderea ireversibila a moralitatii acestuia ii provoaca frica."
  },
  {
    question: "Ghita incearca sa se opuna fortei malefice a antagonistului pentru ca:",
    answers: ["Vrea sa isi impuna autoritatea si sa iti salveze casnicia.", "Lica nu a platit consumul porcarilor sai.", "Asa ii zice fostul partener al samadaului."],
    correctIndex: 0,
    explanation: "La urmatoarea vizita a lui Lica dupa cearta cu Ana, Ghita incearca sa se impotriveasca."
  },
  {
    question: "Ce faceau Ana cu Lica cand i-a prins Ghita?",
    answers: ["Lica ii dadea bani Anei.", "Ana vroia sa plece cu Lica, ea fiind in rolul adulterinei.", "Ana este un agent sub acoperire si il aresteaza pe Lica."],
    correctIndex: 1,
    explanation: "Ghita ajunge sa isi sacrifice sotia, aruncand-o in bratele samadaului."
  },
  {
    question: "Ce/Cine a ars carciuma din temelii?",
    answers: ["Ghita;", "Acolitii lui Lica sau insasi samadaul.", "Fulgerul;"],
    correctIndex: 2,
    explanation: "Fulgerul este evenimentul natural care a inceput focul purificator, redand sacrilitatea locului, deoarece carciuma era situata pe fostul cimitir."
  },
  {
    question: "Unde ajunge toata averea carciumarului",
    answers: ["Lui Lica, care fuge si scapa.", "Soacrei si copiilor;", "Arde odata cu carciuma."],
    correctIndex: 1,
    explanation: "Averea ramasa ajunge la soacra si copii, fiind defapt, singurii care nu au fost corupti de ispita banului"
  },
];
 
/*logica testului*/
let score = 0;
let answeredCount = 0;
 
const quizBody = document.getElementById('quizBody');
const scoreDisplay = document.getElementById('scoreDisplay');
const finalScoreBox = document.getElementById('finalScore');
 
function renderQuiz() {
  quizData.forEach((q, qIndex) => {
    const block = document.createElement('div');
    block.className = 'question-block';
 
    const questionText = document.createElement('div');
    questionText.className = 'question-text';
    questionText.textContent = `${qIndex + 1}. ${q.question}`;
    block.appendChild(questionText);
 
    const grid = document.createElement('div');
    grid.className = 'answer-grid';
 
    q.answers.forEach((answerText, aIndex) => {
      const btn = document.createElement('button');
      btn.className = 'answer-btn';
      btn.textContent = answerText;
      btn.addEventListener('click', () => handleAnswer(qIndex, aIndex, grid, btn));
      grid.appendChild(btn);
    });
 
    block.appendChild(grid);
    quizBody.appendChild(block);
  });
}
 
function handleAnswer(qIndex, chosenIndex, grid, chosenBtn) {
  const question = quizData[qIndex];
  const isCorrect = chosenIndex === question.correctIndex;
 

  const allButtons = grid.querySelectorAll('.answer-btn');
  allButtons.forEach((b) => (b.disabled = true));
 
  if (isCorrect) {
    chosenBtn.classList.add('correct');
    score += 1;
  } else {
    chosenBtn.classList.add('incorrect');
   
    allButtons[question.correctIndex].classList.add('correct');
  }
 
  
  const feedback = document.createElement('div');
  feedback.className = `feedback-box ${isCorrect ? 'right' : 'wrong'}`;
 
  if (isCorrect) {
    feedback.innerHTML = `<strong>Correct!</strong>${question.explanation}`;
  } else {
    feedback.innerHTML = `<strong>Correct answer: ${question.answers[question.correctIndex]}</strong>${question.explanation}`;
  }
 
  grid.parentElement.appendChild(feedback);
 
  scoreDisplay.textContent = score;
  answeredCount += 1;
 
  if (answeredCount === quizData.length) {
    showFinalScore();
  }
}
 
function showFinalScore() {
  finalScoreBox.textContent = `${score} / ${quizData.length}`;
  finalScoreBox.classList.remove('hidden');
}
 
renderQuiz();