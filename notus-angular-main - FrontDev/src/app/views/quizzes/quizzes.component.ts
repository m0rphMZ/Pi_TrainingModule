import { Component, OnInit } from '@angular/core';
import { QuizService } from '../../services/quiz.service'; 
import { Quiz } from '../quiz/quiz.model';

@Component({
  selector: 'app-quizzes',
  templateUrl: './quizzes.component.html',
  styleUrls: ['./quizzes.component.css']
})
export class QuizzesComponent implements OnInit {
  quizzes: Quiz[] = []; // Declare a quizzes array to store fetched data

  constructor(private quizService: QuizService) {}

  ngOnInit(): void {
    this.quizService.getQuizzes().subscribe(quizzes => {
      this.quizzes = quizzes;
    });
  }
}
