import { Component, OnInit } from '@angular/core';
import { QuizService } from '../../../../services/quiz.service'; 
import { Quiz } from '../../../quiz/quiz.model';
import { Router } from '@angular/router';

@Component({
  selector: 'app-available-quizzes',
  templateUrl: './available-quizzes.component.html',
  styleUrls: ['./available-quizzes.component.css']
})
export class AvailableQuizzesComponent implements OnInit {

  quizzes: Quiz[] = [];

  constructor(private quizService: QuizService, private router: Router) {}

  ngOnInit(): void {
    this.quizService.getQuizzes()
        .subscribe(quizzes => this.quizzes = quizzes);
  } 
}
