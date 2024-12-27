import 'app_database.dart';
import 'dao/exercise_dao.dart';
import 'models/exercise.dart';

class DatabaseHelper {
  static late final AppDatabase database;

  static Future<void> initialize() async {
    database = await $FloorAppDatabase
        .databaseBuilder('app_database.db')
        .build();

    // Load data on first launch
    final dao = database.exerciseDao;
    await dao.clearTable(); // Clear the table before adding data
    await _loadInitialExercises(dao);
  }

  static Future<void> _loadInitialExercises(ExerciseDao dao) async {
    // Sample data
    final exercises = [
      Exercise(
        name: 'Bench Press',
        description: 'An exercise for developing chest muscles.',
        muscleGroup: 'Chest',
        imageUrl: 'assets/exercise/press_bench.png',
      ),
      Exercise(
        name: 'Dips for Lower Chest',
        description: 'Exercise focusing on the lower part of the chest muscles.',
        muscleGroup: 'Chest',
        imageUrl: 'assets/exercise/dips_lower_chest.png',
      ),
      Exercise(
        name: 'Dumbbell Fly',
        description: 'For isolating chest muscles.',
        muscleGroup: 'Chest',
        imageUrl: 'assets/exercise/dumbbell_fly.png',
      ),
      Exercise(
        name: 'Ring Push-ups',
        description: 'A challenging exercise for strengthening chest muscles.',
        muscleGroup: 'Chest',
        imageUrl: 'assets/exercise/ring_pushups.png',
      ),
      Exercise(
        name: 'Dumbbell Pullover',
        description: 'A combined exercise for chest and back muscles.',
        muscleGroup: 'Chest',
        imageUrl: 'assets/exercise/dumbbell_pullover.png',
      ),
      Exercise(
        name: 'Incline Dumbbell Press',
        description: 'Exercise for the upper part of the chest muscles.',
        muscleGroup: 'Chest',
        imageUrl: 'assets/exercise/incline_dumbbell_press.png',
      ),
      Exercise(
        name: 'Push-ups',
        description: 'A classic chest exercise.',
        muscleGroup: 'Chest',
        imageUrl: 'assets/exercise/pushups.png',
      ),
      Exercise(
        name: 'Crossover',
        description: 'Cable work for isolating the chest.',
        muscleGroup: 'Chest',
        imageUrl: 'assets/exercise/crossover.png',
      ),
      Exercise(
        name: 'Close-grip Push-ups',
        description: 'Focuses on the inner chest area.',
        muscleGroup: 'Chest',
        imageUrl: 'assets/exercise/close_grip_pushups.png',
      ),
      Exercise(
        name: 'Pec Deck Machine',
        description: 'Isolation for chest muscles.',
        muscleGroup: 'Chest',
        imageUrl: 'assets/exercise/pec_deck.png',
      ),
      // Back
      Exercise(
        name: 'Wide-grip Pull-ups',
        description: 'A classic exercise for the lats.',
        muscleGroup: 'Back',
        imageUrl: 'assets/exercise/wide_pullups.png',
      ),
      Exercise(
        name: 'Barbell Row',
        description: 'Develops lats and rhomboids.',
        muscleGroup: 'Back',
        imageUrl: 'assets/exercise/barbell_row.png',
      ),
      Exercise(
        name: 'Lat Pulldown',
        description: 'Simulates pull-ups with added resistance.',
        muscleGroup: 'Back',
        imageUrl: 'assets/exercise/lat_pulldown.png',
      ),
      Exercise(
        name: 'Seated Cable Row',
        description: 'Focuses on back thickness.',
        muscleGroup: 'Back',
        imageUrl: 'assets/exercise/seated_row.png',
      ),
      Exercise(
        name: 'Deadlift',
        description: 'A fundamental exercise for the entire back.',
        muscleGroup: 'Back',
        imageUrl: 'assets/exercise/deadlift.png',
      ),
      Exercise(
        name: 'One-arm Dumbbell Row',
        description: 'Targets the lower lats.',
        muscleGroup: 'Back',
        imageUrl: 'assets/exercise/one_arm_row.png',
      ),
      Exercise(
        name: 'Hyperextensions',
        description: 'Strengthens the lower back.',
        muscleGroup: 'Back',
        imageUrl: 'assets/exercise/hyperextensions.png',
      ),
      Exercise(
        name: 'Chin-ups',
        description: 'Focuses on the lower part of the lats.',
        muscleGroup: 'Back',
        imageUrl: 'assets/exercise/chinups.png',
      ),
      Exercise(
        name: 'Upright Row',
        description: 'Targets the upper back.',
        muscleGroup: 'Back',
        imageUrl: 'assets/exercise/upright_row.png',
      ),
      Exercise(
        name: 'T-bar Row',
        description: 'Builds the thickness of the mid-back.',
        muscleGroup: 'Back',
        imageUrl: 'assets/exercise/t_bar_row.png',
      ),
      // Shoulders
      Exercise(
        name: 'Standing Barbell Press',
        description: 'A foundational exercise for the shoulder girdle.',
        muscleGroup: 'Shoulders',
        imageUrl: 'assets/exercise/overhead_press.png',
      ),
      Exercise(
        name: 'Lateral Dumbbell Raises',
        description: 'Targets the middle deltoid.',
        muscleGroup: 'Shoulders',
        imageUrl: 'assets/exercise/lateral_raise.png',
      ),
      Exercise(
        name: 'Arnold Press',
        description: 'Works all parts of the deltoids.',
        muscleGroup: 'Shoulders',
        imageUrl: 'assets/exercise/arnold_press.png',
      ),
      Exercise(
        name: 'Rear Delt Raises',
        description: 'Focuses on the rear deltoid.',
        muscleGroup: 'Shoulders',
        imageUrl: 'assets/exercise/rear_delt_raise.png',
      ),
      Exercise(
        name: 'Seated Dumbbell Press',
        description: 'For the upper shoulders.',
        muscleGroup: 'Shoulders',
        imageUrl: 'assets/exercise/seated_dumbbell_press.png',
      ),
      // Arms
      Exercise(
        name: 'Bicep Curls',
        description: 'A fundamental exercise for bicep development.',
        muscleGroup: 'Arms',
        imageUrl: 'assets/exercise/bicep_curls.png',
      ),
      Exercise(
        name: 'Tricep Dips',
        description: 'Targets the tricep muscles.',
        muscleGroup: 'Arms',
        imageUrl: 'assets/exercise/tricep_dips.png',
      ),

      // Legs
      Exercise(
        name: 'Squats',
        description: 'A full-body exercise focusing on the legs and glutes.',
        muscleGroup: 'Legs',
        imageUrl: 'assets/exercise/squats.png',
      ),
      Exercise(
        name: 'Lunges',
        description: 'Works the quads, hamstrings, and glutes.',
        muscleGroup: 'Legs',
        imageUrl: 'assets/exercise/lunges.png',
      ),
      Exercise(
        name: 'Leg Press',
        description: 'Isolates the quads and glutes.',
        muscleGroup: 'Legs',
        imageUrl: 'assets/exercise/leg_press.png',
      ),
      Exercise(
        name: 'Deadlifts',
        description: 'Strengthens the hamstrings and glutes.',
        muscleGroup: 'Legs',
        imageUrl: 'assets/exercise/deadlifts.png',
      ),
      Exercise(
        name: 'Calf Raises',
        description: 'Targets the calf muscles.',
        muscleGroup: 'Legs',
        imageUrl: 'assets/exercise/calf_raises.png',
      ),
      Exercise(
        name: 'Step-ups',
        description: 'Focuses on the legs and stability.',
        muscleGroup: 'Legs',
        imageUrl: 'assets/exercise/step_ups.png',
      ),

      // Abs
      Exercise(
        name: 'Plank',
        description: 'A core exercise for abdominal strength.',
        muscleGroup: 'Abs',
        imageUrl: 'assets/exercise/plank.png',
      ),
      Exercise(
        name: 'Crunches',
        description: 'Isolates the abdominal muscles.',
        muscleGroup: 'Abs',
        imageUrl: 'assets/exercise/crunches.png',
      ),

    ];

    for (var exercise in exercises) {
      await dao.insertExercise(exercise);
    }
  }

  // Получение упражнений для группы мышц
  static Future<List<Exercise>> getExercisesByMuscleGroup(String muscleGroup) {
    return database.exerciseDao.getExercisesByMuscleGroup(muscleGroup);
  }
}
