import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators, FormArray } from '@angular/forms';
import { QuizService } from '../../services/quiz.service'; 
import { Quiz } from '../quiz/quiz.model';
import { QuizQuestion } from '../quiz/quiz-question.model';
import { Router } from '@angular/router'; 
import { TrainingContentService } from '../../services/training-content.service';
import { TrainingContent } from '../quiz/training-content.model';

@Component({
  selector: 'app-add-quiz',
  templateUrl: './add-quiz.component.html',
  styleUrls: ['./add-quiz.component.css']
})
export class AddQuizComponent implements OnInit {
  newQuizForm: FormGroup; 

  errorMessage: string | null = null;

  trainingContents: TrainingContent[] = [];

  constructor(private formBuilder: FormBuilder, 
              private quizService: QuizService,
              private trainingContentService: TrainingContentService ,
              private router: Router) {}  

              

  ngOnInit() {
    this.buildForm(); 
    this.fetchTrainingContents();
  }

  fetchTrainingContents() {
    this.trainingContentService.getTrainingContents()
      .subscribe(contents => this.trainingContents = contents);
  }

  private displayErrorMessage(message: string) {
    this.errorMessage = message;
}

  buildForm() { 
    this.newQuizForm = this.formBuilder.group({
      title: ['', Validators.required], 
      description: [''], 
      passingScore: [70, Validators.min(0)],
      type: ['', Validators.required],
      questions: this.formBuilder.array([]),
      trainingContentId: ['', Validators.required]
    });
  }

  get questionsFormArray(): FormArray {
    return this.newQuizForm.get('questions') as FormArray;
  }

  addQuestion() {
    const questionGroup = this.formBuilder.group({
      text: ['', Validators.required],
      answerChoiceA: ['', Validators.required], 
      answerChoiceB: ['', Validators.required], 
      answerChoiceC: ['', Validators.required], 
      answerChoiceD: ['', Validators.required], 
      correctAnswer: ['', Validators.required],
      explanation: [''], 
      essayAnswerExample: ['']
    });
    this.questionsFormArray.push(questionGroup);
  }

  removeQuestion(index: number) {
    this.questionsFormArray.removeAt(index);
  }

  onCreateQuizSubmit() {
    if (this.newQuizForm.invalid) { 
      this.displayErrorMessage('Please fill in all required fields.');
      return; 
    }
 
    const newQuizData = this.newQuizForm.value; 
    if (newQuizData.questions.length < 2) {
      this.displayErrorMessage('Please add at least two questions.');
      return; 
    }
 
    // Your existing code to send data to the backend remains unchanged:
    console.log(newQuizData)
    this.quizService.createQuiz(newQuizData)
        .subscribe(savedQuiz => {
            this.router.navigate(['/quizzes']);
        }, 
        error => {
            console.error("Console Error creating quiz:", error);
        });
 }
 
}
