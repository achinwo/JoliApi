
public typealias SeedData = (
    users: [User],
    musicrooms: [Musicroom],
    roomtracks: [RoomTrack],
    tracks: [Track],
    queuedtracks: [QueuedTrack]
)

public let SEED_DATA = SeedData(users: [User].fromString("""
[
    {
        "id": 1,
        "created_at": "2019-10-29T15:00:41Z",
        "updated_at": "2019-10-29T15:00:41Z",
        "name": "Obialo Chidiebere",
        "password_hash": "$2b$10$JHt9M11yz69cYM8fJP61AeXtjo7ImF/6wdrB3kXOKkkhjLFjAG2wG",
        "email": "obialo@yahoo.com",
        "dj_ranking": 1
    },
    {
        "id": 2,
        "created_at": "2019-10-29T15:00:41Z",
        "updated_at": "2020-01-07T00:06:20Z",
        "name": "Hawa C",
        "password_hash": "$2b$10$4lCsESfC13wqodm/DVLwQeRSwnwKpIMBPutU30JmASIHwiZkSKJjC",
        "email": "hawa@gmail.net",
        "dj_ranking": 7,
        "active_room_id": 1
    },
    {
        "id": 3,
        "created_at": "2019-10-29T15:00:41Z",
        "updated_at": "2020-01-06T14:51:17Z",
        "name": "Top Cat",
        "password_hash": "$2b$10$4lCsESfC13wqodm/DVLwQeRSwnwKpIMBPutU30JmASIHwiZkSKJjC",
        "email": "tc@gmail.net",
        "dj_ranking": 6,
        "active_room_id": 1
    }
]
""")!,
musicrooms: [Musicroom].fromString("""
[
    {
        "id": 1,
        "created_by_id": 1,
        "updated_by_id": 1,
        "created_at": "2019-10-26T14:18:56Z",
        "updated_at": "2019-10-26T14:18:56Z",
        "details": "starboy ting",
        "name": "Wiz Party",
        "membership": "open"
    },
    {
        "id": 2,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-20T22:13:02Z",
        "updated_at": "2019-12-20T22:13:02Z",
        "details": "🏃‍♀️Workout Tunes 🏋️‍♂️",
        "name": "Amirious 👸🏽",
        "membership": "inviteOnly"
    },
    {
        "id": 3,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-20T22:15:20Z",
        "updated_at": "2019-12-20T22:15:20Z",
        "details": "🐈 🎩 TC 😺😽",
        "name": "Top Cat",
        "membership": "private"
    },
    {
        "id": 4,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-20T22:16:10Z",
        "updated_at": "2019-12-20T22:16:10Z",
        "details": "👾👾🤖🦾",
        "name": "Area 51 👽",
        "membership": "open"
    }
]
""")!,
roomtracks: [RoomTrack].fromString("""
[
    {
        "id": 1,
        "created_by_id": 2,
        "created_at": "2019-10-15T21:16:56Z",
        "updated_at": "2019-10-15T21:16:56Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 1
    },
    {
        "id": 2,
        "created_by_id": 2,
        "created_at": "2019-10-15T23:16:56Z",
        "updated_at": "2019-10-15T23:16:56Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 2
    },
    {
        "id": 3,
        "created_by_id": 2,
        "created_at": "2019-10-29T22:49:37Z",
        "updated_at": "2019-10-29T22:49:37Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 3
    },
    {
        "id": 4,
        "created_by_id": 2,
        "created_at": "2019-10-29T23:16:43Z",
        "updated_at": "2019-10-29T23:16:43Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 4
    },
    {
        "id": 5,
        "created_by_id": 2,
        "created_at": "2019-10-29T23:22:00Z",
        "updated_at": "2019-10-29T23:22:00Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 5
    },
    {
        "id": 6,
        "created_by_id": 2,
        "created_at": "2019-10-31T19:18:59Z",
        "updated_at": "2019-10-31T19:18:59Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 6
    },
    {
        "id": 7,
        "created_by_id": 2,
        "created_at": "2019-10-31T19:24:16Z",
        "updated_at": "2019-10-31T19:24:16Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 7
    },
    {
        "id": 8,
        "created_by_id": 2,
        "created_at": "2019-10-31T19:35:17Z",
        "updated_at": "2019-10-31T19:35:17Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 8
    },
    {
        "id": 9,
        "created_by_id": 2,
        "created_at": "2019-10-31T19:41:46Z",
        "updated_at": "2019-10-31T19:41:46Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 9
    },
    {
        "id": 10,
        "created_by_id": 2,
        "created_at": "2019-10-31T20:02:10Z",
        "updated_at": "2019-10-31T20:02:10Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 10
    },
    {
        "id": 11,
        "created_by_id": 2,
        "created_at": "2019-11-01T12:20:18Z",
        "updated_at": "2019-11-01T12:20:18Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 11
    },
    {
        "id": 12,
        "created_by_id": 2,
        "created_at": "2019-11-01T13:12:55Z",
        "updated_at": "2019-11-01T13:12:55Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 12
    },
    {
        "id": 13,
        "created_by_id": 2,
        "created_at": "2019-11-07T10:06:13Z",
        "updated_at": "2019-11-07T10:06:13Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 13
    },
    {
        "id": 14,
        "created_by_id": 2,
        "created_at": "2019-11-10T18:03:30Z",
        "updated_at": "2019-11-10T18:03:30Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 15
    },
    {
        "id": 15,
        "created_by_id": 2,
        "created_at": "2019-11-10T20:57:54Z",
        "updated_at": "2019-11-10T20:57:54Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 17
    },
    {
        "id": 16,
        "created_by_id": 1,
        "created_at": "2019-11-10T22:33:35Z",
        "updated_at": "2019-11-10T22:33:35Z",
        "room_id": 1,
        "track_id": 18
    },
    {
        "id": 17,
        "created_by_id": 1,
        "created_at": "2019-11-10T22:36:08Z",
        "updated_at": "2019-11-10T22:36:08Z",
        "room_id": 1,
        "track_id": 19
    },
    {
        "id": 18,
        "created_by_id": 1,
        "created_at": "2019-11-10T22:39:13Z",
        "updated_at": "2019-11-10T22:39:13Z",
        "room_id": 1,
        "track_id": 20
    },
    {
        "id": 19,
        "created_by_id": 1,
        "created_at": "2019-11-10T22:52:12Z",
        "updated_at": "2019-11-10T22:52:12Z",
        "room_id": 1,
        "track_id": 21
    },
    {
        "id": 20,
        "created_by_id": 1,
        "created_at": "2019-11-10T22:52:46Z",
        "updated_at": "2019-11-10T22:52:46Z",
        "room_id": 1,
        "track_id": 22
    },
    {
        "id": 21,
        "created_by_id": 1,
        "created_at": "2019-11-10T22:58:31Z",
        "updated_at": "2019-11-10T22:58:31Z",
        "room_id": 1,
        "track_id": 23
    },
    {
        "id": 22,
        "created_by_id": 1,
        "created_at": "2019-11-10T23:00:13Z",
        "updated_at": "2019-11-10T23:00:13Z",
        "room_id": 1,
        "track_id": 24
    },
    {
        "id": 23,
        "created_by_id": 1,
        "created_at": "2019-11-10T23:03:43Z",
        "updated_at": "2019-11-10T23:03:43Z",
        "room_id": 1,
        "track_id": 14
    },
    {
        "id": 24,
        "created_by_id": 1,
        "created_at": "2019-11-10T23:04:36Z",
        "updated_at": "2019-11-10T23:04:36Z",
        "room_id": 1,
        "track_id": 25
    },
    {
        "id": 25,
        "created_by_id": 1,
        "created_at": "2019-11-10T23:04:53Z",
        "updated_at": "2019-11-10T23:04:53Z",
        "room_id": 1,
        "track_id": 26
    },
    {
        "id": 26,
        "created_by_id": 1,
        "created_at": "2019-11-10T23:07:28Z",
        "updated_at": "2019-11-10T23:07:28Z",
        "room_id": 1,
        "track_id": 27
    },
    {
        "id": 27,
        "created_by_id": 1,
        "created_at": "2019-11-10T23:11:05Z",
        "updated_at": "2019-11-10T23:11:05Z",
        "room_id": 1,
        "track_id": 28
    },
    {
        "id": 28,
        "created_by_id": 1,
        "created_at": "2019-11-10T23:16:38Z",
        "updated_at": "2019-11-10T23:16:38Z",
        "room_id": 1,
        "track_id": 29
    },
    {
        "id": 29,
        "created_by_id": 1,
        "created_at": "2019-11-10T23:21:41Z",
        "updated_at": "2019-11-10T23:21:41Z",
        "room_id": 1,
        "track_id": 30
    },
    {
        "id": 30,
        "created_by_id": 1,
        "created_at": "2019-11-11T16:28:20Z",
        "updated_at": "2019-11-11T16:28:20Z",
        "room_id": 1,
        "track_id": 32
    },
    {
        "id": 31,
        "created_by_id": 1,
        "created_at": "2019-11-12T17:49:10Z",
        "updated_at": "2019-11-12T17:49:10Z",
        "room_id": 1,
        "track_id": 33
    },
    {
        "id": 32,
        "created_by_id": 1,
        "updated_by_id": 14,
        "created_at": "2019-11-16T09:04:54Z",
        "updated_at": "2019-11-16T09:04:54Z",
        "room_id": 1,
        "track_id": 34
    },
    {
        "id": 33,
        "created_by_id": 1,
        "updated_by_id": 14,
        "created_at": "2019-11-16T11:55:09Z",
        "updated_at": "2019-11-16T11:55:09Z",
        "room_id": 1,
        "track_id": 35
    },
    {
        "id": 34,
        "created_by_id": 1,
        "updated_by_id": 14,
        "created_at": "2019-11-16T12:39:51Z",
        "updated_at": "2019-11-16T12:39:51Z",
        "room_id": 1,
        "track_id": 36
    },
    {
        "id": 35,
        "created_by_id": 1,
        "updated_by_id": 14,
        "created_at": "2019-11-16T12:45:52Z",
        "updated_at": "2019-11-16T12:45:52Z",
        "room_id": 1,
        "track_id": 37
    },
    {
        "id": 36,
        "created_by_id": 1,
        "updated_by_id": 14,
        "created_at": "2019-11-23T16:28:34Z",
        "updated_at": "2019-11-23T16:28:34Z",
        "room_id": 1,
        "track_id": 38
    },
    {
        "id": 37,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-19T03:05:28Z",
        "updated_at": "2019-12-19T03:05:28Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 39
    },
    {
        "id": 38,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-19T03:22:15Z",
        "updated_at": "2019-12-19T03:22:15Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 40
    },
    {
        "id": 39,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-19T03:48:16Z",
        "updated_at": "2019-12-19T03:48:16Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 41
    },
    {
        "id": 40,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-19T12:30:00Z",
        "updated_at": "2019-12-19T12:30:00Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 42
    },
    {
        "id": 41,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-19T12:37:04Z",
        "updated_at": "2019-12-19T12:37:04Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 43
    },
    {
        "id": 42,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-19T12:42:09Z",
        "updated_at": "2019-12-19T12:42:09Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 44
    },
    {
        "id": 43,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-19T12:48:15Z",
        "updated_at": "2019-12-19T12:48:15Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 45
    },
    {
        "id": 44,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-19T12:55:22Z",
        "updated_at": "2019-12-19T12:55:22Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 46
    },
    {
        "id": 45,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-19T12:59:19Z",
        "updated_at": "2019-12-19T12:59:19Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 47
    },
    {
        "id": 46,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-19T13:01:33Z",
        "updated_at": "2019-12-19T13:01:33Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 48
    },
    {
        "id": 47,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-19T13:03:21Z",
        "updated_at": "2019-12-19T13:03:21Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 49
    },
    {
        "id": 48,
        "created_by_id": 1,
        "created_at": "2019-12-19T15:57:32Z",
        "updated_at": "2019-12-19T15:57:32Z",
        "room_id": 1,
        "track_id": 16
    },
    {
        "id": 49,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-20T17:30:29Z",
        "updated_at": "2019-12-20T17:30:29Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 39
    },
    {
        "id": 50,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-21T21:03:50Z",
        "updated_at": "2019-12-21T21:03:50Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 39
    },
    {
        "id": 51,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-21T21:38:32Z",
        "updated_at": "2019-12-21T21:38:32Z",
        "added_by": 2,
        "room_id": 2,
        "track_id": 40
    },
    {
        "id": 52,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-21T21:41:17Z",
        "updated_at": "2019-12-21T21:41:17Z",
        "added_by": 2,
        "room_id": 2,
        "track_id": 41
    },
    {
        "id": 53,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-21T22:28:11Z",
        "updated_at": "2019-12-21T22:28:11Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 40
    },
    {
        "id": 54,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-22T13:03:24Z",
        "updated_at": "2019-12-22T13:03:24Z",
        "added_by": 3,
        "room_id": 4,
        "track_id": 42
    },
    {
        "id": 55,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-22T15:25:20Z",
        "updated_at": "2019-12-22T15:25:20Z",
        "added_by": 3,
        "room_id": 1,
        "track_id": 43
    },
    {
        "id": 56,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-22T19:35:15Z",
        "updated_at": "2019-12-22T19:35:15Z",
        "added_by": 3,
        "room_id": 1,
        "track_id": 44
    },
    {
        "id": 57,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-23T01:54:03Z",
        "updated_at": "2019-12-23T01:54:03Z",
        "added_by": 3,
        "room_id": 1,
        "track_id": 45
    },
    {
        "id": 58,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-23T16:49:32Z",
        "updated_at": "2019-12-23T16:49:32Z",
        "added_by": 3,
        "room_id": 1,
        "track_id": 46
    },
    {
        "id": 59,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-23T16:56:56Z",
        "updated_at": "2019-12-23T16:56:56Z",
        "added_by": 3,
        "room_id": 3,
        "track_id": 47
    },
    {
        "id": 60,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-23T16:57:02Z",
        "updated_at": "2019-12-23T16:57:02Z",
        "added_by": 3,
        "room_id": 3,
        "track_id": 48
    },
    {
        "id": 61,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-23T17:02:09Z",
        "updated_at": "2019-12-23T17:02:09Z",
        "added_by": 3,
        "room_id": 3,
        "track_id": 49
    },
    {
        "id": 62,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-23T17:16:13Z",
        "updated_at": "2019-12-23T17:16:13Z",
        "added_by": 3,
        "room_id": 1,
        "track_id": 50
    },
    {
        "id": 63,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-23T18:56:32Z",
        "updated_at": "2019-12-23T18:56:32Z",
        "added_by": 3,
        "room_id": 3,
        "track_id": 51
    },
    {
        "id": 64,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-24T00:53:22Z",
        "updated_at": "2019-12-24T00:53:22Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 52
    },
    {
        "id": 65,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-24T19:58:30Z",
        "updated_at": "2019-12-24T19:58:30Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 53
    },
    {
        "id": 66,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-24T20:06:14Z",
        "updated_at": "2019-12-24T20:06:14Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 54
    },
    {
        "id": 67,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-25T18:28:28Z",
        "updated_at": "2019-12-25T18:28:28Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 55
    },
    {
        "id": 68,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-25T18:28:47Z",
        "updated_at": "2019-12-25T18:28:47Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 56
    },
    {
        "id": 69,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-25T19:10:42Z",
        "updated_at": "2019-12-25T19:10:42Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 57
    },
    {
        "id": 70,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-29T01:10:26Z",
        "updated_at": "2019-12-29T01:10:26Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 58
    },
    {
        "id": 71,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-29T02:50:31Z",
        "updated_at": "2019-12-29T02:50:31Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 59
    },
    {
        "id": 72,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-31T11:53:31Z",
        "updated_at": "2019-12-31T11:53:31Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 60
    },
    {
        "id": 73,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-31T19:33:10Z",
        "updated_at": "2019-12-31T19:33:10Z",
        "added_by": 3,
        "room_id": 1,
        "track_id": 61
    },
    {
        "id": 74,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-31T22:11:26Z",
        "updated_at": "2019-12-31T22:11:26Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 62
    },
    {
        "id": 75,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-31T22:11:45Z",
        "updated_at": "2019-12-31T22:11:45Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 63
    },
    {
        "id": 76,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T00:10:22Z",
        "updated_at": "2020-01-01T00:10:22Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 64
    },
    {
        "id": 77,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T13:24:51Z",
        "updated_at": "2020-01-01T13:24:51Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 65
    },
    {
        "id": 78,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T13:26:59Z",
        "updated_at": "2020-01-01T13:26:59Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 66
    },
    {
        "id": 79,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T14:31:05Z",
        "updated_at": "2020-01-01T14:31:05Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 67
    },
    {
        "id": 80,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T20:27:43Z",
        "updated_at": "2020-01-01T20:27:43Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 68
    },
    {
        "id": 81,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T20:39:25Z",
        "updated_at": "2020-01-01T20:39:25Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 69
    },
    {
        "id": 82,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-02T12:57:35Z",
        "updated_at": "2020-01-02T12:57:35Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 70
    },
    {
        "id": 83,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-06T11:34:59Z",
        "updated_at": "2020-01-06T11:34:59Z",
        "added_by": 2,
        "room_id": 1,
        "track_id": 71
    },
    {
        "id": 84,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2020-01-06T14:49:22Z",
        "updated_at": "2020-01-06T14:49:22Z",
        "added_by": 3,
        "room_id": 1,
        "track_id": 72
    },
    {
        "id": 85,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2020-01-06T14:50:59Z",
        "updated_at": "2020-01-06T14:50:59Z",
        "added_by": 3,
        "room_id": 1,
        "track_id": 73
    }
]
""")!,
tracks: [Track].fromString("""
[
    {
        "id": 1,
        "created_by_id": 1,
        "created_at": "2019-10-01T09:18:56Z",
        "updated_at": "2019-10-01T09:18:56Z",
        "title": "Fever",
        "track_id": "5mN3xSyvCmFy1jkdA98IfS",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048512e74362b470526cda9f124eb",
        "artist_name": "WizKid",
        "uri": "spotify:track:5mN3xSyvCmFy1jkdA98IfS"
    },
    {
        "id": 3,
        "created_by_id": 2,
        "created_at": "2019-10-29T22:49:37Z",
        "updated_at": "2019-10-29T22:49:37Z",
        "title": "Destiny",
        "track_id": "6E6FNzunXMiidgxtnyX61d",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485155375ff19ae4e7ab60da3cac",
        "artist_name": "Burna Boy",
        "uri": "spotify:track:6E6FNzunXMiidgxtnyX61d"
    },
    {
        "id": 4,
        "created_by_id": 2,
        "created_at": "2019-10-29T23:16:43Z",
        "updated_at": "2019-10-29T23:16:43Z",
        "title": "Anybody",
        "track_id": "44SSviC4R1TkAdsyptjDpE",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485155375ff19ae4e7ab60da3cac",
        "artist_name": "Burna Boy",
        "uri": "spotify:track:44SSviC4R1TkAdsyptjDpE"
    },
    {
        "id": 5,
        "created_by_id": 2,
        "created_at": "2019-10-29T23:22:00Z",
        "updated_at": "2019-10-29T23:22:00Z",
        "title": "Dangote",
        "track_id": "07XZZTucIfMyOSnkF0GPWJ",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485155375ff19ae4e7ab60da3cac",
        "artist_name": "Burna Boy",
        "uri": "spotify:track:07XZZTucIfMyOSnkF0GPWJ"
    },
    {
        "id": 6,
        "created_by_id": 2,
        "created_at": "2019-10-31T19:18:59Z",
        "updated_at": "2019-10-31T19:18:59Z",
        "title": "Natural Something",
        "track_id": "4y0VxK9ExJfzASABa6XFq9",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d00004851ada0de0463a421985b6d3d87",
        "artist_name": "Sound Sultan",
        "uri": "spotify:track:4y0VxK9ExJfzASABa6XFq9"
    },
    {
        "id": 7,
        "created_by_id": 2,
        "created_at": "2019-10-31T19:24:16Z",
        "updated_at": "2019-10-31T19:24:16Z",
        "title": "Joro",
        "track_id": "3Yt1ovsh3v3VEzRuhI1TL5",
        "thumbnail_url": "https://i.scdn.co/image/ab88af626c28d02d943e3054426b0456c3ec0aa9",
        "artist_name": "WizKid",
        "uri": "spotify:track:3Yt1ovsh3v3VEzRuhI1TL5"
    },
    {
        "id": 8,
        "created_by_id": 2,
        "created_at": "2019-10-31T19:35:17Z",
        "updated_at": "2019-10-31T19:35:17Z",
        "title": "Ultralight Beam",
        "track_id": "1eQBEelI2NCy7AUTerX0KS",
        "thumbnail_url": "https://i.scdn.co/image/e57a2620d1e37e036dfca1ba3b20b3b312bc39b0",
        "artist_name": "Kanye West",
        "uri": "spotify:track:1eQBEelI2NCy7AUTerX0KS"
    },
    {
        "id": 9,
        "created_by_id": 2,
        "created_at": "2019-10-31T19:41:46Z",
        "updated_at": "2019-10-31T19:41:46Z",
        "title": "Collateral Damage",
        "track_id": "5srIkb35ees5dhgjK3zdfz",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485155375ff19ae4e7ab60da3cac",
        "artist_name": "Burna Boy",
        "uri": "spotify:track:5srIkb35ees5dhgjK3zdfz"
    },
    {
        "id": 10,
        "created_by_id": 2,
        "created_at": "2019-10-31T20:02:10Z",
        "updated_at": "2019-10-31T20:02:10Z",
        "title": "7 rings",
        "track_id": "6ocbgoVGwYJhOv1GgI9NsF",
        "thumbnail_url": "https://i.scdn.co/image/e1485e7ea6a9cb1d5bdd96e86e9246188670bbc7",
        "artist_name": "Ariana Grande",
        "uri": "spotify:track:6ocbgoVGwYJhOv1GgI9NsF"
    },
    {
        "id": 11,
        "created_by_id": 2,
        "created_at": "2019-11-01T12:20:18Z",
        "updated_at": "2019-11-01T12:20:18Z",
        "title": "Pull Up",
        "track_id": "3sEcJ4mGZ9srlXdG7G2HK1",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485155375ff19ae4e7ab60da3cac",
        "artist_name": "Burna Boy",
        "uri": "spotify:track:3sEcJ4mGZ9srlXdG7G2HK1"
    },
    {
        "id": 12,
        "created_by_id": 2,
        "created_at": "2019-11-01T13:12:55Z",
        "updated_at": "2019-11-01T13:12:55Z",
        "title": "Soapy",
        "track_id": "67Ar5yu8mH1rOVInvnsG0U",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485169fd95d0a8501ae6fc3a7d35",
        "artist_name": "Naira Marley",
        "uri": "spotify:track:67Ar5yu8mH1rOVInvnsG0U"
    },
    {
        "id": 13,
        "created_by_id": 2,
        "created_at": "2019-11-07T10:06:13Z",
        "updated_at": "2019-11-07T10:06:13Z",
        "title": "Killin Dem (feat. Zlatan)",
        "track_id": "3a7ziOOO3Cbuv6BMXrj0wU",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485155375ff19ae4e7ab60da3cac",
        "artist_name": "Burna Boy",
        "uri": "spotify:track:3a7ziOOO3Cbuv6BMXrj0wU"
    },
    {
        "id": 14,
        "created_by_id": 2,
        "created_at": "2019-11-07T21:08:51Z",
        "updated_at": "2019-11-07T21:08:51Z",
        "title": "POWER",
        "track_id": "2gZUPNdnz5Y45eiGxpHGSc",
        "thumbnail_url": "https://i.scdn.co/image/3ead980571eebac7cda4d0d414cf588a4ee5dfb2",
        "artist_name": "Kanye West",
        "uri": "spotify:track:2gZUPNdnz5Y45eiGxpHGSc"
    },
    {
        "id": 15,
        "created_by_id": 2,
        "created_at": "2019-11-10T18:03:30Z",
        "updated_at": "2019-11-10T18:03:30Z",
        "title": "Stunt 101",
        "track_id": "6QdVBqkKNUqCqercvUHMkP",
        "thumbnail_url": "https://i.scdn.co/image/cdb4fcb7f25f708117437701efde49c0c91b4227",
        "artist_name": "G-Unit",
        "uri": "spotify:track:6QdVBqkKNUqCqercvUHMkP"
    },
    {
        "id": 16,
        "created_by_id": 2,
        "created_at": "2019-11-10T20:15:49Z",
        "updated_at": "2019-11-10T20:15:49Z",
        "title": "Jaiye Jaiye (feat. Femi Kuti)",
        "track_id": "2gRzl3pbDoFoHfzRsmkQhf",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048516ab931c7f2d0be44324e7b75",
        "artist_name": "WizKid",
        "uri": "spotify:track:2gRzl3pbDoFoHfzRsmkQhf"
    },
    {
        "id": 17,
        "created_by_id": 2,
        "created_at": "2019-11-10T20:57:54Z",
        "updated_at": "2019-11-10T20:57:54Z",
        "title": "49-99",
        "track_id": "0uyUSBG4Ckupz511Al25D7",
        "thumbnail_url": "https://i.scdn.co/image/ad9f307d0c061266b9fbc2c0c536ff429f3a6ef1",
        "artist_name": "Tiwa Savage",
        "uri": "spotify:track:0uyUSBG4Ckupz511Al25D7"
    },
    {
        "id": 18,
        "created_by_id": 1,
        "created_at": "2019-11-10T22:33:35Z",
        "updated_at": "2019-11-10T22:33:35Z",
        "title": "Oats In The Water",
        "track_id": "4dr5sJ1p6mdNpK3fIUz8vR",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048513714006cfee92e92a6c1ea2f",
        "artist_name": "Ben Howard",
        "uri": "spotify:track:4dr5sJ1p6mdNpK3fIUz8vR"
    },
    {
        "id": 19,
        "created_by_id": 1,
        "created_at": "2019-11-10T22:36:08Z",
        "updated_at": "2019-11-10T22:36:08Z",
        "title": "Over The Moon Ft. K-Switch",
        "track_id": "3R963wuVpbDXyzKHUS25Tc",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485138da19d872f1bd271ba684c3",
        "artist_name": "Dr SID",
        "uri": "spotify:track:3R963wuVpbDXyzKHUS25Tc"
    },
    {
        "id": 20,
        "created_by_id": 1,
        "created_at": "2019-11-10T22:39:13Z",
        "updated_at": "2019-11-10T22:39:13Z",
        "title": "Baby Hello",
        "track_id": "2f01lzvK7sbH4Rj0IbXHsH",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d00004851ace3b617bfc64293e1449bcf",
        "artist_name": "Wande Coal",
        "uri": "spotify:track:2f01lzvK7sbH4Rj0IbXHsH"
    },
    {
        "id": 21,
        "created_by_id": 1,
        "created_at": "2019-11-10T22:52:12Z",
        "updated_at": "2019-11-10T22:52:12Z",
        "title": "Dorobucci (feat. Don Jazzy, Dr Sid, Dr Sid Tiwa Savage, Reekado Banks, Di'ja, Korede Bello & D'prince)",
        "track_id": "06B0pbiRWZJAfxJXu6R4wY",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048514d6cc9846f2348912bcad15e",
        "artist_name": "Mavins",
        "uri": "spotify:track:06B0pbiRWZJAfxJXu6R4wY"
    },
    {
        "id": 22,
        "created_by_id": 1,
        "created_at": "2019-11-10T22:52:46Z",
        "updated_at": "2019-11-10T22:52:46Z",
        "title": "Wait",
        "track_id": "4Xmi5cwFzWGkuxIkcOoOgC",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048517202e7c769b08e969061bea0",
        "artist_name": "Teni",
        "uri": "spotify:track:4Xmi5cwFzWGkuxIkcOoOgC"
    },
    {
        "id": 23,
        "created_by_id": 1,
        "created_at": "2019-11-10T22:58:31Z",
        "updated_at": "2019-11-10T22:58:31Z",
        "title": "Cat D",
        "track_id": "0AhxC06fhuYv0eyyMQro88",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485127b248e2fa5fc340a39d4e3b",
        "artist_name": "George The Poet",
        "uri": "spotify:track:0AhxC06fhuYv0eyyMQro88"
    },
    {
        "id": 24,
        "created_by_id": 1,
        "created_at": "2019-11-10T23:00:13Z",
        "updated_at": "2019-11-10T23:00:13Z",
        "title": "Trap Queen",
        "track_id": "5iNRPN7oYQvdB9AmeSW6d3",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d00004851207dd27959f179f42b01ab18",
        "artist_name": "Fetty Wap",
        "uri": "spotify:track:5iNRPN7oYQvdB9AmeSW6d3"
    },
    {
        "id": 25,
        "created_by_id": 1,
        "created_at": "2019-11-10T23:04:36Z",
        "updated_at": "2019-11-10T23:04:36Z",
        "title": "Shut Up",
        "track_id": "2LPUvD5DDOO4UYGkWgjI2C",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048519536e13edd9e2e08d2dae94b",
        "artist_name": "Stormzy",
        "uri": "spotify:track:2LPUvD5DDOO4UYGkWgjI2C"
    },
    {
        "id": 26,
        "created_by_id": 1,
        "created_at": "2019-11-10T23:04:53Z",
        "updated_at": "2019-11-10T23:04:53Z",
        "title": "Location (feat. Burna Boy)",
        "track_id": "3z4CGd63tpUn9a6oQSG0CI",
        "thumbnail_url": "https://i.scdn.co/image/690ab3e2f24bda9b69fc31f2e6e6036da6db48ae",
        "artist_name": "Dave",
        "uri": "spotify:track:3z4CGd63tpUn9a6oQSG0CI"
    },
    {
        "id": 27,
        "created_by_id": 1,
        "created_at": "2019-11-10T23:07:28Z",
        "updated_at": "2019-11-10T23:07:28Z",
        "title": "Out Here ft Stormzy",
        "track_id": "4Xyknsoebo4vLrNh2EcvNa",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048519d82c25ee762ea54c5f944ca",
        "artist_name": "Tanika",
        "uri": "spotify:track:4Xyknsoebo4vLrNh2EcvNa"
    },
    {
        "id": 28,
        "created_by_id": 1,
        "created_at": "2019-11-10T23:11:05Z",
        "updated_at": "2019-11-10T23:11:05Z",
        "title": "Able God",
        "track_id": "4afLrLDQKTxn1dFc9ejnLd",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485159fdf7332d49a0fcb162d1ce",
        "artist_name": "Chinko Ekun",
        "uri": "spotify:track:4afLrLDQKTxn1dFc9ejnLd"
    },
    {
        "id": 29,
        "created_by_id": 1,
        "created_at": "2019-11-10T23:16:38Z",
        "updated_at": "2019-11-10T23:16:38Z",
        "title": "On The Low",
        "track_id": "1PoJXULCvl03b1fiZmMxmd",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485155375ff19ae4e7ab60da3cac",
        "artist_name": "Burna Boy",
        "uri": "spotify:track:1PoJXULCvl03b1fiZmMxmd"
    },
    {
        "id": 30,
        "created_by_id": 1,
        "created_at": "2019-11-10T23:21:41Z",
        "updated_at": "2019-11-10T23:21:41Z",
        "title": "John Cena",
        "track_id": "07xpeB1txX9bPKTwkuflMg",
        "thumbnail_url": "https://i.scdn.co/image/9a86987f8e03d3dcc5ef88056e612ab6cd4b10d7",
        "artist_name": "Sho Madjozi",
        "uri": "spotify:track:07xpeB1txX9bPKTwkuflMg"
    },
    {
        "id": 31,
        "created_by_id": 2,
        "created_at": "2019-11-10T23:46:48Z",
        "updated_at": "2019-11-10T23:46:48Z",
        "title": "Go Hard",
        "track_id": "6stxKQ2M28z3YYHxVnyTVv",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048515664e8534419778db8945730",
        "artist_name": "DJ Khaled",
        "uri": "spotify:track:6stxKQ2M28z3YYHxVnyTVv"
    },
    {
        "id": 32,
        "created_by_id": 1,
        "created_at": "2019-11-11T16:28:20Z",
        "updated_at": "2019-11-11T16:28:20Z",
        "title": "Ye",
        "track_id": "3FskQrDXcY24ur2fCvz35O",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048516840e87d0809f65014309322",
        "artist_name": "Burna Boy",
        "uri": "spotify:track:3FskQrDXcY24ur2fCvz35O"
    },
    {
        "id": 33,
        "created_by_id": 1,
        "created_at": "2019-11-12T17:49:10Z",
        "updated_at": "2019-11-12T17:49:10Z",
        "title": "Many Men (Wish Death)",
        "track_id": "2FOuylHUHUYLjMi7yhxdca",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d00004851b0a374e7c7b1f9a8b5270bbc",
        "artist_name": "50 Cent",
        "uri": "spotify:track:2FOuylHUHUYLjMi7yhxdca"
    },
    {
        "id": 34,
        "created_by_id": 1,
        "updated_by_id": 14,
        "created_at": "2019-11-16T09:04:54Z",
        "updated_at": "2019-11-16T09:04:54Z",
        "title": "Pursuit Of Happiness (Nightmare)",
        "track_id": "4kTLpAbhuEGHAAdDjOIWaa",
        "thumbnail_url": "https://i.scdn.co/image/33d045cb992102d3bcc2bd54d6f35063c95edfb9",
        "artist_name": "Kid Cudi",
        "uri": "spotify:track:4kTLpAbhuEGHAAdDjOIWaa"
    },
    {
        "id": 35,
        "created_by_id": 1,
        "updated_by_id": 14,
        "created_at": "2019-11-16T11:55:08Z",
        "updated_at": "2019-11-16T11:55:08Z",
        "title": "God Bless Amerika",
        "track_id": "4wLFAxDMU8Eb1cuumqBe1z",
        "thumbnail_url": "https://i.scdn.co/image/0959219eb51da8e580060253b297851dbcbbdb05",
        "artist_name": "Lil Wayne",
        "uri": "spotify:track:4wLFAxDMU8Eb1cuumqBe1z"
    },
    {
        "id": 36,
        "created_by_id": 1,
        "updated_by_id": 14,
        "created_at": "2019-11-16T12:39:51Z",
        "updated_at": "2019-11-16T12:39:51Z",
        "title": "Originality",
        "track_id": "3HiOl35AFUDGNJYHtLPlq1",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d00004851bd91479fbddb8ee3401a9e52",
        "artist_name": "Faze",
        "uri": "spotify:track:3HiOl35AFUDGNJYHtLPlq1"
    },
    {
        "id": 37,
        "created_by_id": 1,
        "updated_by_id": 14,
        "created_at": "2019-11-16T12:45:52Z",
        "updated_at": "2019-11-16T12:45:52Z",
        "title": "Ojuelegba",
        "track_id": "6cTLhp8a39TClL2iqGpPVc",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048516ab931c7f2d0be44324e7b75",
        "artist_name": "WizKid",
        "uri": "spotify:track:6cTLhp8a39TClL2iqGpPVc"
    },
    {
        "id": 38,
        "created_by_id": 1,
        "updated_by_id": 14,
        "created_at": "2019-11-23T16:28:34Z",
        "updated_at": "2019-11-23T16:28:34Z",
        "title": "Come Thru (with Usher)",
        "track_id": "3TTMUI5dFcbeNSDTTDY9M8",
        "thumbnail_url": "https://i.scdn.co/image/9afdd4a74ea7c542d408006097ffd31dfe775c4b",
        "artist_name": "Summer Walker",
        "uri": "spotify:track:3TTMUI5dFcbeNSDTTDY9M8"
    },
    {
        "id": 39,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-21T21:03:50Z",
        "updated_at": "2019-12-21T21:03:50Z",
        "title": "Hot Girl Summer (feat. Nicki Minaj & Ty Dolla $ign)",
        "track_id": "5N1o6d8zGcSZSeMFkOUQOk",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048519dcf842e1b19fc15b1ad31dc",
        "artist_name": "Megan Thee Stallion",
        "uri": "spotify:track:5N1o6d8zGcSZSeMFkOUQOk"
    },
    {
        "id": 40,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-21T21:38:32Z",
        "updated_at": "2019-12-21T21:38:32Z",
        "title": "Own It (feat. Ed Sheeran & Burna Boy)",
        "track_id": "4QPEwDdOMhY7rNS05mTyMR",
        "thumbnail_url": "https://i.scdn.co/image/d0ba4b1886674bf487c91a0b505f581c97ff558f",
        "artist_name": "Stormzy",
        "uri": "spotify:track:4QPEwDdOMhY7rNS05mTyMR"
    },
    {
        "id": 41,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-21T21:41:17Z",
        "updated_at": "2019-12-21T21:41:17Z",
        "title": "Lessons",
        "track_id": "5iVGN1Th2DqyWVNIBM8Vwk",
        "thumbnail_url": "https://i.scdn.co/image/d0ba4b1886674bf487c91a0b505f581c97ff558f",
        "artist_name": "Stormzy",
        "uri": "spotify:track:5iVGN1Th2DqyWVNIBM8Vwk"
    },
    {
        "id": 42,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-22T13:03:24Z",
        "updated_at": "2019-12-22T13:03:24Z",
        "title": "The Show Goes On",
        "track_id": "4NTWZqvfQTlOMitlVn6tew",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485120cac893b7a494f729128dac",
        "artist_name": "Lupe Fiasco",
        "uri": "spotify:track:4NTWZqvfQTlOMitlVn6tew"
    },
    {
        "id": 43,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-22T15:25:20Z",
        "updated_at": "2019-12-22T15:25:20Z",
        "title": "Ghetto Love",
        "track_id": "4lzkcjVC7xT3HBIg2PjJ30",
        "thumbnail_url": "https://i.scdn.co/image/dc9fc46bae4a0e363876bdb2742e6ca9cb3cc554",
        "artist_name": "WizKid",
        "uri": "spotify:track:4lzkcjVC7xT3HBIg2PjJ30"
    },
    {
        "id": 44,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-22T19:35:15Z",
        "updated_at": "2019-12-22T19:35:15Z",
        "title": "Beginning",
        "track_id": "5wHi0nR9PGCygrfhSxI3Hq",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485160fb04fa3d1df3761da084cb",
        "artist_name": "Joeboy",
        "uri": "spotify:track:5wHi0nR9PGCygrfhSxI3Hq"
    },
    {
        "id": 45,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-23T01:54:03Z",
        "updated_at": "2019-12-23T01:54:03Z",
        "title": "Fresh Az I'm Iz",
        "track_id": "5ZOfHnTDRa9NHCdscBILvn",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d00004851c0e4b61ae442a24e020c67ed",
        "artist_name": "Bow Wow",
        "uri": "spotify:track:5ZOfHnTDRa9NHCdscBILvn"
    },
    {
        "id": 46,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-23T16:49:32Z",
        "updated_at": "2019-12-23T16:49:32Z",
        "title": "Hey Ya!",
        "track_id": "2PpruBYCo4H7WOBJ7Q2EwM",
        "thumbnail_url": "https://i.scdn.co/image/d47dbff9debcb370a9807f93de4a081bbc9727e5",
        "artist_name": "OutKast",
        "uri": "spotify:track:2PpruBYCo4H7WOBJ7Q2EwM"
    },
    {
        "id": 47,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-23T16:56:56Z",
        "updated_at": "2019-12-23T16:56:56Z",
        "title": "Gbona",
        "track_id": "7rpWDu9GPlLxbLorYKVys7",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485155375ff19ae4e7ab60da3cac",
        "artist_name": "Burna Boy",
        "uri": "spotify:track:7rpWDu9GPlLxbLorYKVys7"
    },
    {
        "id": 48,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-23T16:57:02Z",
        "updated_at": "2019-12-23T16:57:02Z",
        "title": "African Giant",
        "track_id": "5Yu8xJwe9SPpFY2s3jDnvj",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485155375ff19ae4e7ab60da3cac",
        "artist_name": "Burna Boy",
        "uri": "spotify:track:5Yu8xJwe9SPpFY2s3jDnvj"
    },
    {
        "id": 49,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-23T17:02:09Z",
        "updated_at": "2019-12-23T17:02:09Z",
        "title": "Bobo",
        "track_id": "0N6lUfSwuOWlmP2YUGtIZb",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485144a55478ddc497eca42b4f9e",
        "artist_name": "Olamide",
        "uri": "spotify:track:0N6lUfSwuOWlmP2YUGtIZb"
    },
    {
        "id": 50,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-23T17:16:13Z",
        "updated_at": "2019-12-23T17:16:13Z",
        "title": "Gongo Aso",
        "track_id": "5JEw4FrNlWmHxgBkw0jbEj",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485170a3ddc1f224e54f33c90f77",
        "artist_name": "9ice",
        "uri": "spotify:track:5JEw4FrNlWmHxgBkw0jbEj"
    },
    {
        "id": 51,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-23T18:56:32Z",
        "updated_at": "2019-12-23T18:56:32Z",
        "title": "Big Ole Freak",
        "track_id": "3YEbLhXRDPTtctnb3ddg8g",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048516cf50daf249842c725cef102",
        "artist_name": "Megan Thee Stallion",
        "uri": "spotify:track:3YEbLhXRDPTtctnb3ddg8g"
    },
    {
        "id": 52,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-24T00:53:22Z",
        "updated_at": "2019-12-24T00:53:22Z",
        "title": "Juicy (feat. Tyga)",
        "track_id": "7f5trao56t7sB7f14QDTmp",
        "thumbnail_url": "https://i.scdn.co/image/de7f23bf4ace105d8b2a54f1082d1d059988b11d",
        "artist_name": "Doja Cat",
        "uri": "spotify:track:7f5trao56t7sB7f14QDTmp"
    },
    {
        "id": 53,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-24T19:58:30Z",
        "updated_at": "2019-12-24T19:58:30Z",
        "title": "Spiritual",
        "track_id": "5nc35fYrpKw3EPd5i9jqqP",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485155375ff19ae4e7ab60da3cac",
        "artist_name": "Burna Boy",
        "uri": "spotify:track:5nc35fYrpKw3EPd5i9jqqP"
    },
    {
        "id": 54,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-24T20:06:14Z",
        "updated_at": "2019-12-24T20:06:14Z",
        "title": "Shotan",
        "track_id": "3TIihuGgtTxwjA0DXLqrv2",
        "thumbnail_url": "https://i.scdn.co/image/c82ac35ed14480f96543d57b6440efa44f3565c3",
        "artist_name": "Zlatan",
        "uri": "spotify:track:3TIihuGgtTxwjA0DXLqrv2"
    },
    {
        "id": 55,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-25T18:28:28Z",
        "updated_at": "2019-12-25T18:28:28Z",
        "title": "Wo Wo Wo",
        "track_id": "16454pKCMf8EuxLOGehYQR",
        "thumbnail_url": "https://i.scdn.co/image/29b8cac9c18980e0832ad94e6c107bd168e8da86",
        "artist_name": "Krept & Konan",
        "uri": "spotify:track:16454pKCMf8EuxLOGehYQR"
    },
    {
        "id": 56,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-25T18:28:47Z",
        "updated_at": "2019-12-25T18:28:47Z",
        "title": "Tell Me",
        "track_id": "3GDPQVjCQj1WyJGJhAj53E",
        "thumbnail_url": "https://i.scdn.co/image/798fd8d9895c2fc1f515ad19cf1c0f618caee65f",
        "artist_name": "Krept & Konan",
        "uri": "spotify:track:3GDPQVjCQj1WyJGJhAj53E"
    },
    {
        "id": 57,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-25T19:10:42Z",
        "updated_at": "2019-12-25T19:10:42Z",
        "title": "Must Be",
        "track_id": "2n1oPHJVMPWJkjgHwVcksY",
        "thumbnail_url": "https://i.scdn.co/image/7d157d3ccc8ac89422f2daaec803e9b7d216b244",
        "artist_name": "J Hus",
        "uri": "spotify:track:2n1oPHJVMPWJkjgHwVcksY"
    },
    {
        "id": 58,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-29T01:10:26Z",
        "updated_at": "2019-12-29T01:10:26Z",
        "title": "Welcome To The Party",
        "track_id": "0fIffclhgJC5h8AdMMVvkp",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048518fe5d04b06aff90f9fe796f5",
        "artist_name": "Pop Smoke",
        "uri": "spotify:track:0fIffclhgJC5h8AdMMVvkp"
    },
    {
        "id": 59,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-29T02:50:30Z",
        "updated_at": "2019-12-29T02:50:30Z",
        "title": "Toast",
        "track_id": "7sd72KZS8D59g5NmhxyHpJ",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d00004851dca1f17bc5ae38d946571386",
        "artist_name": "Koffee",
        "uri": "spotify:track:7sd72KZS8D59g5NmhxyHpJ"
    },
    {
        "id": 60,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-31T11:53:31Z",
        "updated_at": "2019-12-31T11:53:31Z",
        "title": "Baby",
        "track_id": "02KGBPy9mVdvo4dPXxt3h5",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048512d671e8489d8d0e3e5ba6c8b",
        "artist_name": "Joeboy",
        "uri": "spotify:track:02KGBPy9mVdvo4dPXxt3h5"
    },
    {
        "id": 61,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-31T19:33:10Z",
        "updated_at": "2019-12-31T19:33:10Z",
        "title": "Shayo",
        "track_id": "5L8sLsICLumcnGHCYZecu0",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d00004851cc34e72b10986f22ba7765c7",
        "artist_name": "Bigiano",
        "uri": "spotify:track:5L8sLsICLumcnGHCYZecu0"
    },
    {
        "id": 62,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-31T22:11:26Z",
        "updated_at": "2019-12-31T22:11:26Z",
        "title": "The Money",
        "track_id": "2i418MNsgYexNdHJ3AwCgd",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d00004851b0839f231578f3c7908b329e",
        "artist_name": "DaVido",
        "uri": "spotify:track:2i418MNsgYexNdHJ3AwCgd"
    },
    {
        "id": 63,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-31T22:11:45Z",
        "updated_at": "2019-12-31T22:11:45Z",
        "title": "Wetin We Gain",
        "track_id": "5faqpitzDhJKv3huL8nJhp",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048519e3c354df3839e03fb23c7fc",
        "artist_name": "Victor AD",
        "uri": "spotify:track:5faqpitzDhJKv3huL8nJhp"
    },
    {
        "id": 64,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T00:10:22Z",
        "updated_at": "2020-01-01T00:10:22Z",
        "title": "Daydreamin' (feat. Jill Scott)",
        "track_id": "50M2QjfSM82wkJ1d0iV4mh",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d00004851a81ec0503c55850ad4687940",
        "artist_name": "Lupe Fiasco",
        "uri": "spotify:track:50M2QjfSM82wkJ1d0iV4mh"
    },
    {
        "id": 65,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T13:24:51Z",
        "updated_at": "2020-01-01T13:24:51Z",
        "title": "Skeleton Move",
        "track_id": "5CSzwZL5C35k9h5QF2HI40",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048517979f6c2f7a6bd9a0b649ed6",
        "artist_name": "Master KG",
        "uri": "spotify:track:5CSzwZL5C35k9h5QF2HI40"
    },
    {
        "id": 66,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T13:26:59Z",
        "updated_at": "2020-01-01T13:26:59Z",
        "title": "Vibration",
        "track_id": "7u0z6FcJDqkZwdpqAqUzmO",
        "thumbnail_url": "https://i.scdn.co/image/eef64d1fcd1938d3160599c6a38c930898040a94",
        "artist_name": "Fireboy DML",
        "uri": "spotify:track:7u0z6FcJDqkZwdpqAqUzmO"
    },
    {
        "id": 67,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T14:31:05Z",
        "updated_at": "2020-01-01T14:31:05Z",
        "title": "Skelewu",
        "track_id": "2WLpYiWNYtHeS5izWhrh6Q",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d0000485125b55fdcbd411c19320c48ff",
        "artist_name": "DaVido",
        "uri": "spotify:track:2WLpYiWNYtHeS5izWhrh6Q"
    },
    {
        "id": 68,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T20:27:43Z",
        "updated_at": "2020-01-01T20:27:43Z",
        "title": "So Special",
        "track_id": "3QsYrzBz48de2cqm670ym9",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d00004851547ac83b173b65bad39c4b5a",
        "artist_name": "Mavado",
        "uri": "spotify:track:3QsYrzBz48de2cqm670ym9"
    },
    {
        "id": 69,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T20:39:25Z",
        "updated_at": "2020-01-01T20:39:25Z",
        "title": "Flying Away",
        "track_id": "03fA44hMX5cr3X3VzLT4Ed",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d00004851dbf7f8e399b09649018b202f",
        "artist_name": "Naira Marley",
        "uri": "spotify:track:03fA44hMX5cr3X3VzLT4Ed"
    },
    {
        "id": 70,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-02T12:57:35Z",
        "updated_at": "2020-01-02T12:57:35Z",
        "title": "D & G",
        "track_id": "0xr7t6jQWzFsZ9XwfcxAu7",
        "thumbnail_url": "https://i.scdn.co/image/9a95f4f41ddf540943fccb299eec10fcde883d13",
        "artist_name": "DaVido",
        "uri": "spotify:track:0xr7t6jQWzFsZ9XwfcxAu7"
    },
    {
        "id": 71,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-06T11:34:59Z",
        "updated_at": "2020-01-06T11:34:59Z",
        "title": "wys?",
        "track_id": "5NT67c2bpzilrBSc73JEoc",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d000048515a766230e6a4aa382a8ec0fd",
        "artist_name": "AYLØ",
        "uri": "spotify:track:5NT67c2bpzilrBSc73JEoc"
    },
    {
        "id": 72,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2020-01-06T14:49:22Z",
        "updated_at": "2020-01-06T14:49:22Z",
        "title": "Afro Trap Pt. 7 (La puissance)",
        "track_id": "6wdI9sg2VdgjqSg0ozu9PK",
        "thumbnail_url": "https://i.scdn.co/image/0c4d57c09820a6320e292d31fd6730c48f6a7b2f",
        "artist_name": "MHD",
        "uri": "spotify:track:6wdI9sg2VdgjqSg0ozu9PK"
    },
    {
        "id": 73,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2020-01-06T14:50:59Z",
        "updated_at": "2020-01-06T14:50:59Z",
        "title": "Xpensive Habits",
        "track_id": "3lo6d7DEg5HJ4qbx1EQ2Nl",
        "thumbnail_url": "https://i.scdn.co/image/ab67616d00004851e8f57fea9811238258bc7907",
        "artist_name": "One Acen",
        "uri": "spotify:track:3lo6d7DEg5HJ4qbx1EQ2Nl"
    }
]
""")!,
queuedtracks: [QueuedTrack].fromString("""
[
    {
        "id": 1,
        "created_by_id": 2,
        "created_at": "2019-10-15T21:16:56Z",
        "updated_at": "2019-10-15T21:16:56Z",
        "roomtrack_id": 1,
        "track_id": 1,
        "room_id": 1
    },
    {
        "id": 2,
        "created_by_id": 2,
        "created_at": "2019-10-15T23:16:56Z",
        "updated_at": "2019-10-15T23:16:56Z",
        "roomtrack_id": 2,
        "track_id": 2,
        "room_id": 1
    },
    {
        "id": 3,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-29T12:01:16Z",
        "updated_at": "2019-12-29T12:01:16Z",
        "roomtrack_id": 68,
        "track_id": 56,
        "room_id": 1
    },
    {
        "id": 4,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-29T12:01:31Z",
        "updated_at": "2019-12-29T12:01:31Z",
        "roomtrack_id": 64,
        "track_id": 52,
        "room_id": 1
    },
    {
        "id": 5,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-29T12:02:14Z",
        "updated_at": "2019-12-29T12:02:14Z",
        "roomtrack_id": 42,
        "track_id": 44,
        "room_id": 1
    },
    {
        "id": 6,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-29T12:14:05Z",
        "updated_at": "2019-12-29T12:14:05Z",
        "roomtrack_id": 20,
        "track_id": 22,
        "room_id": 1
    },
    {
        "id": 7,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-29T12:23:21Z",
        "updated_at": "2019-12-29T12:23:21Z",
        "roomtrack_id": 65,
        "track_id": 53,
        "room_id": 1
    },
    {
        "id": 8,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-29T12:26:58Z",
        "updated_at": "2019-12-29T12:26:58Z",
        "roomtrack_id": 38,
        "track_id": 40,
        "room_id": 1
    },
    {
        "id": 9,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-29T12:29:13Z",
        "updated_at": "2019-12-29T12:29:13Z",
        "roomtrack_id": 68,
        "track_id": 56,
        "room_id": 1
    },
    {
        "id": 10,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-29T12:37:45Z",
        "updated_at": "2019-12-29T12:37:45Z",
        "roomtrack_id": 6,
        "track_id": 6,
        "room_id": 1
    },
    {
        "id": 11,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-29T12:40:07Z",
        "updated_at": "2019-12-29T12:40:07Z",
        "roomtrack_id": 4,
        "track_id": 4,
        "room_id": 1
    },
    {
        "id": 12,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-29T12:44:53Z",
        "updated_at": "2019-12-29T12:44:53Z",
        "roomtrack_id": 3,
        "track_id": 3,
        "room_id": 1
    },
    {
        "id": 16,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-29T13:06:29Z",
        "updated_at": "2019-12-29T13:06:29Z",
        "roomtrack_id": 69,
        "track_id": 57,
        "room_id": 1
    },
    {
        "id": 17,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-29T13:15:18Z",
        "updated_at": "2019-12-29T13:15:18Z",
        "roomtrack_id": 13,
        "track_id": 13,
        "room_id": 1
    },
    {
        "id": 18,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-31T11:53:37Z",
        "updated_at": "2019-12-31T11:53:37Z",
        "roomtrack_id": 72,
        "track_id": 60,
        "room_id": 1
    },
    {
        "id": 19,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-31T12:18:56Z",
        "updated_at": "2019-12-31T12:18:56Z",
        "roomtrack_id": 70,
        "track_id": 58,
        "room_id": 1
    },
    {
        "id": 20,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-31T17:59:26Z",
        "updated_at": "2019-12-31T17:59:26Z",
        "roomtrack_id": 71,
        "track_id": 59,
        "room_id": 1
    },
    {
        "id": 21,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-31T18:04:33Z",
        "updated_at": "2019-12-31T18:04:33Z",
        "roomtrack_id": 37,
        "track_id": 39,
        "room_id": 1
    },
    {
        "id": 22,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-31T18:05:33Z",
        "updated_at": "2019-12-31T18:05:33Z",
        "roomtrack_id": 14,
        "track_id": 15,
        "room_id": 1
    },
    {
        "id": 23,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2019-12-31T19:33:11Z",
        "updated_at": "2019-12-31T19:33:11Z",
        "roomtrack_id": 73,
        "track_id": 61,
        "room_id": 1
    },
    {
        "id": 24,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2019-12-31T21:02:23Z",
        "updated_at": "2019-12-31T21:02:23Z",
        "roomtrack_id": 22,
        "track_id": 24,
        "room_id": 1
    },
    {
        "id": 25,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T00:10:24Z",
        "updated_at": "2020-01-01T00:10:24Z",
        "roomtrack_id": 76,
        "track_id": 64,
        "room_id": 1
    },
    {
        "id": 26,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T13:24:52Z",
        "updated_at": "2020-01-01T13:24:52Z",
        "roomtrack_id": 77,
        "track_id": 65,
        "room_id": 1
    },
    {
        "id": 27,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T13:27:00Z",
        "updated_at": "2020-01-01T13:27:00Z",
        "roomtrack_id": 78,
        "track_id": 66,
        "room_id": 1
    },
    {
        "id": 28,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T13:34:41Z",
        "updated_at": "2020-01-01T13:34:41Z",
        "roomtrack_id": 75,
        "track_id": 63,
        "room_id": 1
    },
    {
        "id": 29,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T13:50:54Z",
        "updated_at": "2020-01-01T13:50:54Z",
        "roomtrack_id": 74,
        "track_id": 62,
        "room_id": 1
    },
    {
        "id": 30,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T14:04:50Z",
        "updated_at": "2020-01-01T14:04:50Z",
        "roomtrack_id": 7,
        "track_id": 7,
        "room_id": 1
    },
    {
        "id": 31,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T14:21:41Z",
        "updated_at": "2020-01-01T14:21:41Z",
        "roomtrack_id": 5,
        "track_id": 5,
        "room_id": 1
    },
    {
        "id": 32,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T19:07:54Z",
        "updated_at": "2020-01-01T19:07:54Z",
        "roomtrack_id": 46,
        "track_id": 48,
        "room_id": 1
    },
    {
        "id": 33,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T20:27:45Z",
        "updated_at": "2020-01-01T20:27:45Z",
        "roomtrack_id": 80,
        "track_id": 68,
        "room_id": 1
    },
    {
        "id": 34,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-01T20:39:26Z",
        "updated_at": "2020-01-01T20:39:26Z",
        "roomtrack_id": 81,
        "track_id": 69,
        "room_id": 1
    },
    {
        "id": 35,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-02T12:57:36Z",
        "updated_at": "2020-01-02T12:57:36Z",
        "roomtrack_id": 82,
        "track_id": 70,
        "room_id": 1
    },
    {
        "id": 36,
        "created_by_id": 2,
        "updated_by_id": 2,
        "created_at": "2020-01-06T11:35:01Z",
        "updated_at": "2020-01-06T11:35:01Z",
        "roomtrack_id": 83,
        "track_id": 71,
        "room_id": 1
    },
    {
        "id": 37,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2020-01-06T14:46:08Z",
        "updated_at": "2020-01-06T14:46:08Z",
        "roomtrack_id": 67,
        "track_id": 55,
        "room_id": 1
    },
    {
        "id": 38,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2020-01-06T14:49:24Z",
        "updated_at": "2020-01-06T14:49:24Z",
        "roomtrack_id": 84,
        "track_id": 72,
        "room_id": 1
    },
    {
        "id": 39,
        "created_by_id": 3,
        "updated_by_id": 3,
        "created_at": "2020-01-06T14:51:00Z",
        "updated_at": "2020-01-06T14:51:00Z",
        "roomtrack_id": 85,
        "track_id": 73,
        "room_id": 1
    }
]
""")!
)
    