import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { QuizQuestionService } from '../../../../services/quiz-question.service'; // Import your QuizQuestionService
import { QuizQuestion } from '../../../quiz/quiz-question.model'; // Import your QuizQuestion model
import { Quiz } from '../../../quiz/quiz.model'; // Import your Quiz model
import { QuizService } from '../../../../services/quiz.service'; // Import your QuizService

@Component({
  selector: 'app-pass-quiz',
  templateUrl: './pass-quiz.component.html',
  styleUrls: ['./pass-quiz.component.css']
})
export class PassQuizComponent implements OnInit {
  quizQuestions: QuizQuestion[] = [];
  currentQuestionIndex = 0;
  currentQuestion: QuizQuestion | null = null;
  selectedAnswer: string | null = null;
  showCorrectAnswerMessage = false;
  currentQuiz: Quiz | null = null;

  constructor(private route: ActivatedRoute, 
              private quizQuestionService: QuizQuestionService,
              private quizService: QuizService) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      const quizId = Number(params.get('id'));
      this.loadQuiz(quizId);
      this.loadQuizQuestions(quizId);
    });
  }

  loadQuiz(quizId: number): void {
    this.quizService.getQuizById(quizId).subscribe((quiz: Quiz) => {
      this.currentQuiz = quiz;
    });
  }
  

  loadQuizQuestions(quizId: number): void {
    this.quizQuestionService.getQuestionsByQuizId(quizId).subscribe((questions: QuizQuestion[]) => {
      this.quizQuestions = this.shuffleArray(questions);
      this.presentQuestion();
    });
  }

  shuffleArray(array: any[]): any[] {
    // Implement array shuffling (e.g., Fisher-Yates algorithm)
    return array;
  }

  presentQuestion(): void {
    if (this.currentQuestionIndex < this.quizQuestions.length) {
      this.currentQuestion = this.quizQuestions[this.currentQuestionIndex];
      this.selectedAnswer = null; // Reset selected answer for each question
      this.showCorrectAnswerMessage = false; // Reset the flag for showing correct answer message
    } else {
      console.log('End of quiz');
    }
  }

  selectAnswer(answer: string): void {
    this.selectedAnswer = answer;
  }

  onNextQuestion(): void {
    // Check if there is a current question and selected answer
    if (this.currentQuestion && this.selectedAnswer !== null) {
      // Check if the quiz type is ESSAY
      if (this.currentQuiz && this.currentQuiz.type === 'ESSAY') {
        // Move to the next question directly without checking the answer
        this.currentQuestionIndex++;
        this.presentQuestion();
      } else if (this.currentQuiz && this.currentQuiz.type === 'TRUE_FALSE') {
        // Check if the selected answer matches the correct answer
        if ((this.selectedAnswer === 'A' && this.currentQuestion.correctAnswer === 'A') ||
            (this.selectedAnswer === 'B' && this.currentQuestion.correctAnswer === 'B')) {
          // Move to the next question if the answer is correct
          this.currentQuestionIndex++;
          this.presentQuestion();
        } else {
          // Display a message indicating the correct answer
          this.displayCorrectAnswerMessage();
        }
      } else if (this.currentQuiz && this.currentQuiz.type === 'FILL_IN_THE_BLANK') {
        // Check if the selected answer matches the correct answer
        if (this.selectedAnswer.toLowerCase() === this.currentQuestion.correctAnswer.toLowerCase()) {
          // Move to the next question if the answer is correct
          this.currentQuestionIndex++;
          this.presentQuestion();
        } else {
          // Display a message indicating the correct answer
          this.displayCorrectAnswerMessage();
        }
      } else if (this.currentQuiz && this.currentQuiz.type === 'MATCHING') {
        // Check if the selected answer matches the correct answer
        if (this.selectedAnswer === this.currentQuestion.correctAnswer) {
          // Move to the next question if the answer is correct
          this.currentQuestionIndex++;
          this.presentQuestion();
        } else {
          // Display a message indicating the correct answer
          this.displayCorrectAnswerMessage();
        }
      } else {
        // Map the selected answer to a letter (A, B, C, D)
        let selectedLetter: string | null = null;
        switch (this.selectedAnswer) {
          case this.currentQuestion.answerChoiceA:
            selectedLetter = 'A';
            break;
          case this.currentQuestion.answerChoiceB:
            selectedLetter = 'B';
            break;
          case this.currentQuestion.answerChoiceC:
            selectedLetter = 'C';
            break;
          case this.currentQuestion.answerChoiceD:
            selectedLetter = 'D';
            break;
          default:
            selectedLetter = null;
        }
  
        // Check if the selected letter matches the correct answer letter
        if (selectedLetter === this.currentQuestion.correctAnswer) {
          // Move to the next question if the answer is correct
          this.currentQuestionIndex++;
          this.presentQuestion();
        } else {
          // Display a message indicating the correct answer
          this.displayCorrectAnswerMessage();
        }
      }
    }
  }
  
  
  
  


  displayCorrectAnswerMessage(): void {
    // Display a message to the user indicating the correct answer
    this.showCorrectAnswerMessage = true;
  }

}
