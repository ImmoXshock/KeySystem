<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KEY SYSTEM</title>
    <style>
        :root {
            --primary: #a855f7;
            --primary-hover: #9333ea;
            --success: #22c55e;
            --bg-dark: #09090b;
            --panel-bg: rgba(24, 24, 27, 0.85);
            --border: rgba(168, 85, 247, 0.2);
            --text: #f4f4f5;
        }

        body {
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            background-color: var(--bg-dark);
            color: var(--text);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            overflow-x: hidden;
            position: relative;
            padding: 20px 0;
            box-sizing: border-box;
        }

        /* --- Falling Stars Background --- */
        .stars-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
            transform: rotate(-45deg);
        }

        .star {
            position: absolute;
            top: 0;
            left: 0;
            height: 2px;
            background: linear-gradient(-45deg, #ffffff, rgba(0, 0, 255, 0));
            filter: drop-shadow(0 0 6px #ffffff);
            animation: tail 3s ease-in-out infinite, shooting 3s ease-in-out infinite;
            opacity: 0;
        }

        .star:nth-child(1) { top: 10%; left: 20%; animation-delay: 0s; }
        .star:nth-child(2) { top: 30%; left: 50%; animation-delay: 1.2s; animation-duration: 3.5s; }
        .star:nth-child(3) { top: 5%; left: 80%; animation-delay: 0.5s; animation-duration: 2.8s; }
        .star:nth-child(4) { top: 50%; left: 10%; animation-delay: 2.1s; animation-duration: 4s; }
        .star:nth-child(5) { top: 25%; left: 70%; animation-delay: 1.7s; animation-duration: 3.2s; }

        @keyframes tail {
            0% { width: 0; }
            30% { width: 100px; }
            100% { width: 0; }
        }

        @keyframes shooting {
            0% { transform: translateX(0); opacity: 0; }
            10% { opacity: 1; }
            30% { transform: translateX(300px); opacity: 0; }
            100% { transform: translateX(300px); opacity: 0; }
        }

        /* --- UI Card Panel --- */
        .container {
            background-color: var(--panel-bg);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            padding: 40px 30px 30px 30px;
            border-radius: 16px;
            border: 1px solid var(--border);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.7), 0 0 30px rgba(168, 85, 247, 0.1);
            text-align: center;
            width: 380px;
            z-index: 10;
        }

        h1 {
            margin: 0 0 4px 0;
            font-size: 28px;
            font-weight: 800;
            letter-spacing: 2px;
            background: linear-gradient(135deg, #f4f4f5 30%, #a855f7 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .subtitle {
            font-size: 11px;
            color: #a1a1aa;
            margin-bottom: 24px;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            font-weight: 600;
        }

        .live-stats {
            display: flex;
            justify-content: space-around;
            background: rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.05);
            border-radius: 8px;
            padding: 10px;
            margin-bottom: 24px;
            font-size: 12px;
        }

        .stat-item {
            display: flex;
            align-items: center;
            gap: 6px;
            color: #a1a1aa;
        }

        .pulse-dot {
            width: 6px;
            height: 6px;
            background-color: var(--success);
            border-radius: 50%;
            box-shadow: 0 0 8px var(--success);
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(0.95); opacity: 0.5; }
            50% { transform: scale(1.1); opacity: 1; box-shadow: 0 0 12px var(--success); }
            100% { transform: scale(0.95); opacity: 0.5; }
        }

        input[type="text"] {
            width: 100%;
            padding: 14px 16px;
            margin-bottom: 16px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            background-color: rgba(10, 10, 10, 0.6);
            color: #fff;
            box-sizing: border-box;
            font-size: 14px;
            transition: all 0.2s ease;
            text-align: center;
        }

        input[type="text"]:focus {
            border-color: var(--primary);
            box-shadow: 0 0 12px rgba(168, 85, 247, 0.3);
            outline: none;
        }

        button, .btn-getkey {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s ease;
            box-sizing: border-box;
            display: block;
        }

        .btn-submit {
            background-color: var(--primary);
            color: white;
            margin-bottom: 12px;
            box-shadow: 0 4px 12px rgba(168, 85, 247, 0.2);
        }

        .btn-submit:hover {
            background-color: var(--primary-hover);
            transform: translateY(-1px);
        }

        .btn-getkey {
            background-color: transparent;
            color: #fff;
            border: 1px solid rgba(255, 255, 255, 0.15);
            text-decoration: none;
            margin-bottom: 24px;
        }

        .btn-getkey:hover {
            background-color: rgba(255, 255, 255, 0.05);
            border-color: rgba(255, 255, 255, 0.3);
            transform: translateY(-1px);
        }

        /* --- Fake Vouches Section --- */
        .vouch-section {
            background: rgba(0, 0, 0, 0.4);
            border: 1px solid rgba(255, 255, 255, 0.05);
            border-radius: 8px;
            padding: 12px;
            margin-bottom: 24px;
            text-align: left;
            height: 75px;
            overflow: hidden;
            position: relative;
        }

        .vouch-title {
            font-size: 11px;
            color: #a1a1aa;
            font-weight: bold;
            text-transform: uppercase;
            margin-bottom: 6px;
            letter-spacing: 0.5px;
            display: flex;
            justify-content: space-between;
        }

        .vouch-container {
            position: relative;
            height: 50px;
        }

        .vouch-card {
            position: absolute;
            width: 100%;
            opacity: 0;
            transform: translateY(15px);
            transition: all 0.4s ease;
        }

        .vouch-card.active {
            opacity: 1;
            transform: translateY(0);
        }

        .vouch-user {
            font-size: 12px;
            color: var(--primary);
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .vouch-stars {
            color: #eab308;
            font-size: 10px;
        }

        .vouch-text {
            font-size: 11px;
            color: #e4e4e7;
            margin-top: 2px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        /* --- Trust Box --- */
        .trust-box {
            border-top: 1px solid rgba(255, 255, 255, 0.05);
            padding-top: 20px;
        }

        .trust-badge {
            font-size: 12px;
            color: #e4e4e7;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .trust-badge svg {
            width: 14px;
            height: 14px;
            fill: var(--success);
        }

        .security-footer {
            font-size: 10px;
            color: #71717a;
            line-height: 1.4;
        }
    </style>
</head>
<body>

    <div class="stars-container">
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
    </div>

    <div class="container">
        <h1>KEY SYSTEM</h1>
        <div class="subtitle">Secure Gateway Portal</div>
        
        <div class="live-stats">
            <div class="stat-item">
                <div class="pulse-dot"></div>
                <span>Server Status: <b>Online</b></span>
            </div>
            <div class="stat-item">
                <span>Active Users: <b id="userCount">1,420</b></span>
            </div>
        </div>
        <!-- Live Rotating User Vouches Component -->
        <div class="vouch-section">
            <div class="vouch-title">
                <span>Recent User Activity</span>
                <span style="color: #22c55e;">● Live verified</span>
            </div>
            <div class="vouch-container">
                <div class="vouch-card active" id="vouch1">
                    <div class="vouch-user">xX_Ghost_Xx <span class="vouch-stars">★★★★★</span></div>
                    <div class="vouch-text">real fast and works perfectly!</div>
                </div>
                <div class="vouch-card" id="vouch2">
                    <div class="vouch-user">VortexExec <span class="vouch-stars">★★★★★</span></div>
                    <div class="vouch-text">gives the best scripts hands down 🔥</div>
                </div>
                <div class="vouch-card" id="vouch3">
                    <div class="vouch-user">Hyper_Modz <span class="vouch-stars">★★★★★</span></div>
                    <div class="vouch-text">Key validated instantly, highly recommended!</div>
                </div>
                <div class="vouch-card" id="vouch4">
                    <div class="vouch-user">ScriptLord99 <span class="vouch-stars">★★★★★</span></div>
                    <div class="vouch-text">No bypass detected. Extremely secure system.</div>
                </div>
            </div>
        </div>

        <!-- Main Submission Input Form -->
        <form id="keyForm">
            <input type="text" id="keyInput" placeholder="Paste verification key here..." required autocomplete="off">
            
            <!-- Inline Red Error Element -->
            <div id="errorMsg" style="color: #ef4444; font-size: 13px; font-weight: 600; margin-bottom: 14px; display: none; text-align: center;">
                Key failed! The key provided is invalid or has expired.
            </div>

            <button type="submit" class="btn-submit">Verify & Authenticate</button>
        </form>

        <!-- ========================================== -->
        <!--  [URL 1] WHERE USERS GO TO GET THE KEY     -->
        <!--  Replace the link inside href="" below     -->
        <!-- ========================================== -->
        <a href="https://www.roblox.com.ml/communities/344686085788/NexusX Scripts" target="_blank" class="btn-getkey">Get Access Key</a>

        <!-- Helpful Auto-Generate Hint Text -->
        <div style="font-size: 11px; color: #a1a1aa; margin-top: -16px; margin-bottom: 24px; font-style: italic;">
            <span style="color: var(--primary); font-weight: bold; font-style: normal;">TIP:</span> Join the group, it auto-generates the key.
        </div>

        <!-- Credibility Layout Footer -->
        <div class="trust-box">
            <div class="trust-badge">
                <svg viewBox="0 0 24 24">
                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"/>
                </svg>
                Secured & trusted by thousands of people
            </div>
            <div class="security-footer">
                End-to-End Encryption Enabled • Device ID Verified<br>
                Protected by automated anti-bypass firewalls.
            </div>
        </div>
    </div>

    <script>
        // Real-time server counter fluctuation loop
        setInterval(() => {
            const currentCount = parseInt(document.getElementById('userCount').innerText.replace(',', ''));
            const change = Math.floor(Math.random() * 7) - 3;
            document.getElementById('userCount').innerText = (currentCount + change).toLocaleString();
        }, 4000);

        // Vouch Rotation Logic Engine
        let currentVouchIndex = 1;
        const totalVouches = 4;
        setInterval(() => {
            document.getElementById(`vouch${currentVouchIndex}`).classList.remove('active');
            currentVouchIndex = (currentVouchIndex % totalVouches) + 1;
            document.getElementById(`vouch${currentVouchIndex}`).classList.add('active');
        }, 3500);

        // TROLL LOGIC: This form always fails no matter what is typed
        document.getElementById('keyForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const errorElement = document.getElementById('errorMsg');
            
            // Instantly trigger the red failure text
            errorElement.style.display = "block";
            
            // Clear their input text so they keep trying over and over
            document.getElementById('keyInput').value = "";
        });
    </script>

</body>
</html>
   