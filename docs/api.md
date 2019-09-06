
```json5
{
  "plan": {
    "planned_type": "Course",
    "planned_id": 1, 
    "begin_on": "2019-09-01",
    "plan_times_attributes": [] 
  }
}
```

```json5
{
  "plan_times": {
    "repeat_type": "weekly",
    "repeat_days": {
      "1": [1, 3]
    },
    "space_id": 1,
    "plan_participants_attributes": []
  }
}
```

```json5
{
  "plan_participants": {
    "participant_type": "Profile",  // 学生：Profile, 老师：Member，班级：Crowd
    "participant_id": 1 
  }
}
```
