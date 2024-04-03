import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { QuizService } from '../../services/quiz.service'; 
import { Quiz } from '../quiz/quiz.model';
import { Router } from '@angular/router'; 

@Component({
  selector: 'app-add-quiz',
  templateUrl: './add-quiz.component.html',
  styleUrls: ['./add-quiz.component.css']
})
export class AddQuizComponent implements OnInit {
  newQuizForm: FormGroup; 

  constructor(private formBuilder: FormBuilder, 
              private quizService: QuizService,
              private router: Router) {}  

  ngOnInit() {
    this.buildForm(); 
  }

  buildForm() { 
    this.newQuizForm = this.formBuilder.group({
      title: ['', Validators.required], 
      description: [''], 
      passingScore: [70, Validators.min(0)],
      type: ['', Validators.required] // Add validation if needed
    });
  }

  onCreateQuizSubmit() {
    const newQuizData = this.newQuizForm.value; 
    this.quizService.createQuiz(newQuizData)
      .subscribe(savedQuiz => {
        // Success: Navigate to the quizzes list
        this.router.navigate(['/quizzes']);
      }, 
      error => {
        // Handle error (display a message, etc.)
        console.error("Error creating quiz:", error);
      });
  }
}
