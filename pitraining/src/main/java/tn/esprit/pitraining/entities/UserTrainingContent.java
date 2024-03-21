package tn.esprit.pitraining.entities;

import java.time.LocalDateTime; // Use java.time for timestamps

import jakarta.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // Lombok annotation for getters, setters, equals, and hashCode
@AllArgsConstructor // Lombok annotation for full constructor
@NoArgsConstructor // Lombok annotation for empty constructor
@Entity
public class UserTrainingContent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    //@ManyToOne
    //@JoinColumn(name = "user_id", nullable = false) // Not nullable foreign key for User
    //private User user;

    @ManyToOne
    @JoinColumn(name = "training_content_id", nullable = false) // Not nullable foreign key for TrainingContent
    private TrainingContent trainingContent;

    @Column(name = "last_access_time")
    private LocalDateTime lastAccessTime;

    @Column(name = "completion_date")
    private LocalDateTime completionDate;

    @Column
    private Integer score; // Optional score for quizzes (if applicable)
}

