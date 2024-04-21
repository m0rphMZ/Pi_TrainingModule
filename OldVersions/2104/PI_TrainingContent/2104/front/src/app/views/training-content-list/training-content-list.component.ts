import { Component, OnInit } from '@angular/core';
import { TrainingContentService } from '../../services/training-content.service';
import { TrainingContent } from '../quiz/training-content.model';

@Component({
  selector: 'app-training-content-list',
  templateUrl: './training-content-list.component.html',
  styleUrls: ['./training-content-list.component.css']
})
export class TrainingContentListComponent implements OnInit {
  trainingContents: TrainingContent[] = []; // To store fetched data

  constructor(private trainingContentService: TrainingContentService) { }

  ngOnInit(): void {
    this.fetchTrainingContents(); // Fetch on component initialization
  }

  fetchTrainingContents() {
    this.trainingContentService.getTrainingContents()
      .subscribe(contents => this.trainingContents = contents);
  }
}
