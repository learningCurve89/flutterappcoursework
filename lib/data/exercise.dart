import 'package:coursework_2/model/exercise.dart';

Duration setDuration(String level) {
  switch (level) {
    case 'Beginner':
      return Duration(seconds: 20);
    case 'Intermediate':
      return Duration(seconds: 25);
    case 'Advanced':
      return Duration(seconds: 30);
    default:
      return Duration(seconds: 20);
  }
}


final exercises = [
  Exercise(
      id: 1,
      name: 'Pranamasana',
      duration: const Duration(seconds: 20),
      imageUrl: 'assets/images/starting.png',
      audioUrl: 'audio/starting.mp3',
      description: '''
      Pranamasana or ‘Anjali mudra’ is a gesture of reverence that is considered as a sign of respect and greeting in India. Pranamasana is just like ‘Namaste’. 
      
      Benefits of Pranamasana: Relaxes the nervous system and helps in maintaining body balance. It also helps relieve stress and anxiety.
      '''),
  Exercise(
      id: 2,
      name: 'Hasta Uttanasana',
      duration: const Duration(seconds: 20),
      imageUrl: 'assets/images/pose1.png',
      audioUrl: 'audio/pose1.mp3',
      description: '''The name originates from the Sanskrit word meaning upward tree. 
      
          Hasta uttanasana benefits people suffering from asthma. It helps to check backache, fatigue, and mild anxiety. This pose also improves digestion. Avoid looking up if you feel dizzy and don’t overstretch your arms if you experience pain during this surya namaskar pose.
          
          '''),
  Exercise(
      id: 3,
      name: 'Hasta Padasana',
      duration: const Duration(seconds: 20),
      imageUrl: 'assets/images/pose2.png',
      audioUrl: 'audio/pose2.mp3',
      description: '''
      Make sure your spine does not bend. Keep your neck and shoulders relaxed. Press into your heels softly so weight is evenly distributed.
      
      Padasana helps in recovering from insomnia and osteoporosis. This step of surya namaskar relieves anxiety, stress, and headache. It strengthens thighs and knees, stretches hips, hamstrings and calves.
      '''),
  Exercise(
      id: 4,
      name: 'Ashwa Sanchalanasana',
      duration: const Duration(seconds: 20),
      imageUrl: 'assets/images/pose3.png',
      audioUrl: 'audio/pose3.mp3',
      description: '''
      Every yoga asana has its own health benefit. This Sun Salutation pose increases willpower. It strengthens the spine and increases lung capacity. 
      
      It stimulates the digestive system and tones kidney and liver. This Surya Namaskar step should not be practiced if you are suffering from a knee or neck injury.
      '''),
  Exercise(
      id: 5,
      name: 'Chaturanga Dandasana',
      duration: const Duration(seconds: 20),
      imageUrl: 'assets/images/pose4.png',
      audioUrl: 'audio/pose4.mp3',
      description: '''
      Dandasana, the fifth step of surya namaskar tones the abdomen and helps build strength and endurance of arms, shoulders, and wrists.
      
      Don’t practice this Surya namaskar asana pose if you are suffering from severe low back pain or wrist injury.
      '''),
  Exercise(
      id: 6,
      name: 'Ashtanga Namaskar',
      duration: const Duration(seconds: 20),
      imageUrl: 'assets/images/pose5.png',
      audioUrl: 'audio/pose5.mp3',
      description: '''
      Ashtanga Namaskara tones and strengthens the arms, shoulders, and legs. This surya namaskar pose releases tension around the neck and shoulder. It also improves the spine’s flexibility.
      
      Patients suffering from buttock injury, spinal pain or lower back pain should avoid this Surya namaskar step.
      '''),
  Exercise(
      id: 7,
      name: 'Bhujangasana',
      duration: const Duration(seconds: 20),
      imageUrl: 'assets/images/pose7.png',
      audioUrl: 'audio/pose6.mp3',
      description: '''
      Bhujangasana helps in strengthening the torso. It tones abdominal muscles and improves blood circulation. It helps during the menstrual cycle and cures backache and sciatica. 
      
      This asana is also therapeutic for asthma. In case you suffer stomach disorders like ulcer, hernia, back injury, hyperthyroidism, consult a doctor before practicing this Surya Namaskar pose.
      '''),
  Exercise(
      id: 8,
      name: 'Adho Mukha Svanasana',
      duration: const Duration(seconds: 20),
      imageUrl: 'assets/images/pose8.png',
      audioUrl: 'audio/pose7.mp3',
      description: '''
      This Surya Namaskar step has incredible health benefits. It improves blood circulation, calms the nerves, and relieves stress. For women,  It helps relieve symptoms of menopause, back pain, and headaches.
      
      This asana should not be performed by people who are suffering from diarrhea, eye or ear infection, or wrist injuries.
      '''),
  Exercise(
      id: 9,
      name: 'Ashwa Sanchalanasana',
      duration: const Duration(seconds: 20),
      imageUrl: 'assets/images/pose10.png',
      audioUrl: 'audio/pose8.mp3',
      description: '''
      As you complete the eighth step of Surya Namaskar, you will now have to repeat Ashva Sanchalanasana, Uttanasana, Uttana hastasana, and Pranamasana respectively.
      
      This Surya Namaskar step should not be practiced if you are suffering from a knee or neck injury.
      '''),
  Exercise(
      id: 10,
      name: 'Hasta Padasana',
      duration: const Duration(seconds: 20),
      imageUrl: 'assets/images/pose11.png',
      audioUrl: 'audio/pose9.mp3',
      description: '''
      Benefits include the stretching of the hamstrings and opens up the legs. It helps in curing insomnia, osteoporosis, headache, anxiety, and stress.
      '''),
  Exercise(
      id: 11,
      name: 'Hasta Uttanasana',
      duration: const Duration(seconds: 20),
      imageUrl: 'assets/images/pose1.png',
      audioUrl: 'audio/pose10.mp3',
      description: '''
      Avoid looking up if you feel dizzy and don’t overstretch your arms if you experience pain during this surya namaskar pose.
      '''),
  Exercise(
      id: 12,
      name: 'Pranamasana',
      duration: const Duration(seconds: 20),
      imageUrl: 'assets/images/pose12.png',
      audioUrl: 'audio/pose11.mp3',
      description: '''
      As you complete the above 12 steps of Surya namaskar, one cycle of this asana is completed. To avail the maximum benefits of this yoga pose, start from 7 or 12 cycles of sun salutation per day to 21, 24, 54, or even 108 cycles as you master this technique with time.
      '''),
];

