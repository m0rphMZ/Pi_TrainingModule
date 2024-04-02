import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Quiz } from '../views/quiz/quiz.model'; // Assuming your Quiz model location

@Injectable({ providedIn: 'root' })
export class QuizService {
  private backendUrl = 'http://localhost:8080/api';

  constructor(private http: HttpClient) {}

  getQuizzes(): Observable<Quiz[]> {
    return this.http.get<Quiz[]>(`${this.backendUrl}/quizzes`);
  }

  updateQuiz(quizId: number, updatedQuiz: Quiz): Observable<Quiz> {
    return this.http.put<Quiz>(`${this.backendUrl}/quizzes/${quizId}`, updatedQuiz);
  }
  

  deleteQuiz(quizId: number): Observable<void> {
    return this.http.delete<void>(`${this.backendUrl}/quizzes/${quizId}`);
  }  
  
}
