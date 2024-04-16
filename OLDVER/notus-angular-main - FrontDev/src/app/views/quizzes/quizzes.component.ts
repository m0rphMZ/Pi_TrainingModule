import { Component, OnInit } from '@angular/core';
import { QuizService } from '../../services/quiz.service'; 
import { Quiz } from '../quiz/quiz.model';
import { Router } from '@angular/router';

@Component({
  selector: 'app-quizzes',
  templateUrl: './quizzes.component.html',
  styleUrls: ['./quizzes.component.css']
})
export class QuizzesComponent implements OnInit {
  quizzes: Quiz[] = []; // Declare a quizzes array to store fetched data

  constructor(private quizService: QuizService, private router: Router) {} // Inject Router


  ngOnInit(): void {
    this.quizService.getQuizzes().subscribe(quizzes => {
      this.quizzes = quizzes;
    });
  }

  viewQuiz(quizId: number) {
    this.router.navigate(['/quizzes', quizId]); 
  }
  


  updateQuizProperty(quiz: Quiz, property: string) {
    quiz[`editable${property.charAt(0).toUpperCase() + property.slice(1)}`] = false; // Turn off edit mode

    // Make a copy to avoid change detection issues (optional)
    const updatedQuiz = { ...quiz };

    this.quizService.updateQuiz(quiz.id, updatedQuiz)
      .subscribe({
        next: (savedQuiz) => {
          // Update successful 
        },
        error: (err) => {
          console.error('Error updating quiz:', err);
          // Handle the error (e.g., revert the changes).
        }
      });
  }


  confirmDeleteQuiz(quizId: number) {
    if (confirm('Are you sure you want to delete this quiz?')) {
      this.deleteQuiz(quizId);
    }
  }

  deleteQuiz(quizId: number) {
    this.quizService.deleteQuiz(quizId).subscribe({
      next: () => {
        // Successfully deleted: Update the UI immediately
        this.quizzes = this.quizzes.filter(quiz => quiz.id !== quizId); 
      },
      error: (err) => {
        console.error('Error deleting quiz:', err);
        // Handle the error (e.g., display an error message to the user)
      }
    });
  }




}
